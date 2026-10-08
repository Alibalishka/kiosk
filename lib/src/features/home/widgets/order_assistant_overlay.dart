import 'dart:async';
import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/formatters/text_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/utils/qr_pay_image_url.dart';
import 'package:qr_pay_app/src/core/widgets/safe_network_image.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/service/order_assistant.dart';
import 'package:qr_pay_app/src/features/home/widgets/assistant_visuals.dart';

enum _Step { mood, guests, preference, budget, thinking, result }

/// Помощник поверх меню: вопросы кнопками — настроение, сколько гостей,
/// пожелания (только если в меню есть из чего выбирать), бюджет — и готовый
/// набор, который кладётся в корзину одним касанием.
///
/// Живёт в стеке страницы меню под рекламой, а не отдельным роутом: иначе
/// скринсейвер оказался бы под ним. Закрывается сам после простоя.
class OrderAssistantOverlay extends StatefulWidget {
  const OrderAssistantOverlay({
    super.key,
    required this.assistant,
    required this.idleTimeout,
    required this.onAddToBasket,
    required this.onClose,
    this.basketItemIds = const {},
  });

  final OrderAssistant assistant;

  /// Что уже в корзине: помощник предложит это реже — гостю нужно новое.
  final Set<int> basketItemIds;

  /// Через сколько без касаний помощник закрывается сам.
  final Duration idleTimeout;

  /// Кладёт позицию в корзину; `false` — не добавилось. null — заказать на
  /// киоске нельзя (нет способов оплаты): помощник только советует.
  final Future<bool> Function(BuildContext context, Items item, int count)?
      onAddToBasket;
  final VoidCallback onClose;

  @override
  State<OrderAssistantOverlay> createState() => _OrderAssistantOverlayState();
}

class _OrderAssistantOverlayState extends State<OrderAssistantOverlay>
    with TickerProviderStateMixin {
  /// Барабан крутится, пока на экране сменяются шаги анализа: по ~0,55 с
  /// на шаг, но не меньше 2,2 и не больше 3,6 секунды.
  static const int _noteMs = 550;
  static const int _minReelMs = 2200;
  static const int _maxReelMs = 3600;

  /// Пауза «печатает…» перед репликой.
  static const Duration _typingPause = Duration(milliseconds: 450);

  static const double _stagePadding = 24;

  /// Ниже этой высоты (альбом) сфера меньше, док в одну строку, карточки
  /// площе — иначе подборка уходит под кнопки.
  static const double _compactHeight = 900;

  late final AnimationController _presence = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 420),
  )..forward();

  late final CurvedAnimation _presenceCurve = CurvedAnimation(
    parent: _presence,
    curve: Curves.easeOutCubic,
    reverseCurve: Curves.easeInCubic,
  );

  /// Полёт карточек в корзину.
  late final AnimationController _fly = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 750),
  );

  final ScrollController _scroll = ScrollController();

  OrderAssistant get _assistant => widget.assistant;

  _Step _step = _Step.mood;

  /// Текущая реплика помощника. Пустая — пока он «печатает».
  String _line = '';

  /// Ответы гостя — строкой под сферой.
  final List<String> _answers = [];

  /// Реплика допечатана — можно показывать варианты ответа.
  bool _lineDone = false;

  AssistantMood _mood = AssistantMood.hearty;
  int _guests = 1;
  AssistantPreference _preference = AssistantPreference.none;
  List<AssistantPreference> _preferences = const [];
  int? _budget;
  List<int> _budgetPresets = const [];
  AssistantSet? _set;
  Duration _reelDuration = const Duration(milliseconds: _minReelMs);
  late int _seed = DateTime.now().millisecondsSinceEpoch % 100000;

  /// Что уже показывали в этом диалоге: «Другой вариант» предлагает новое.
  final Map<int, int> _shown = {};

  /// Поколение диалога: «Заново» и закрытие отменяют отложенные шаги.
  int _flow = 0;
  bool _adding = false;
  bool _closing = false;
  Timer? _idle;

  @override
  void initState() {
    super.initState();
    _restartIdle();
    _start();
  }

  @override
  void dispose() {
    _flow++;
    _idle?.cancel();
    _presenceCurve.dispose();
    _presence.dispose();
    _fly.dispose();
    _scroll.dispose();
    super.dispose();
  }

  // --------------------------------------------------------------------------
  // Диалог
  // --------------------------------------------------------------------------

  void _start() {
    final flow = ++_flow;
    // Выбирать не из чего (одни пиццы, одни соки) — сразу к гостям.
    final askMood = _assistant.moods.length > 1;
    setState(() {
      _step = askMood ? _Step.mood : _Step.guests;
      _mood = _assistant.defaultMood;
      _answers.clear();
      _set = null;
      _budget = null;
      _preference = AssistantPreference.none;
      _shown.clear();
    });
    _fly.value = 0;
    _say(
      askMood
          ? LocaleKeys.assistantGreeting.tr()
          : LocaleKeys.assistantGreetingGuests.tr(),
      flow,
    );
  }

  Future<void> _say(String text, int flow) async {
    setState(() {
      _line = '';
      _lineDone = false;
    });
    await Future<void>.delayed(_typingPause);
    if (!mounted || flow != _flow) return;
    setState(() => _line = text);
  }

  void _answer(String label) {
    setState(() {
      _answers.add(label);
      _lineDone = false;
    });
    HapticFeedback.selectionClick();
  }

  void _onMood(AssistantMood mood, String label) {
    _answer(label);
    _mood = mood;
    if (mood == AssistantMood.surprise) {
      _guests = 1;
      _budget = null;
      _preference = AssistantPreference.none;
      _think();
      return;
    }
    setState(() => _step = _Step.guests);
    _say(LocaleKeys.assistantAskGuests.tr(), _flow);
  }

  void _onGuests(int guests, String label) {
    _answer(label);
    _guests = guests;
    _preferences = _assistant.preferencesFor(_mood);
    if (_preferences.isEmpty) {
      _askBudget();
      return;
    }
    setState(() => _step = _Step.preference);
    _say(LocaleKeys.assistantAskPreference.tr(), _flow);
  }

  void _onPreference(AssistantPreference preference, String label) {
    _answer(label);
    _preference = preference;
    _askBudget();
  }

  /// Варианты бюджета считаются по реально собранным наборам — уже с учётом
  /// гостей и пожеланий.
  void _askBudget() {
    _budgetPresets = _assistant.budgetPresets(
      _mood,
      _guests,
      preference: _preference,
      now: DateTime.now(),
    );
    if (_budgetPresets.isEmpty) {
      _budget = null;
      _think();
      return;
    }
    setState(() => _step = _Step.budget);
    _say(LocaleKeys.assistantAskBudget.tr(), _flow);
  }

  void _onBudget(int? budget, String label) {
    _answer(label);
    _budget = budget;
    _think();
  }

  AssistantSet _pick() {
    final set = _assistant.pick(
      AssistantRequest(
        mood: _mood,
        guests: _guests,
        budget: _budget,
        preference: _preference,
        now: DateTime.now(),
        inBasket: widget.basketItemIds,
        shown: Map.of(_shown),
      ),
      seed: _seed,
    );
    for (final line in set.lines) {
      _shown[line.dish.id] = (_shown[line.dish.id] ?? 0) + 1;
    }
    return set;
  }

  Future<void> _think() async {
    final flow = _flow;
    final set = _set = _pick();
    _reelDuration = Duration(
      milliseconds:
          (set.notes.length * _noteMs).clamp(_minReelMs, _maxReelMs).toInt(),
    );
    setState(() => _step = _Step.thinking);
    await _say(LocaleKeys.assistantThinking.tr(), flow);
    await Future<void>.delayed(_reelDuration);
    if (!mounted || flow != _flow) return;

    setState(() => _step = _Step.result);
    await _say(
      set.isEmpty
          ? LocaleKeys.assistantEmpty.tr()
          : set.overBudget
              ? LocaleKeys.assistantOverBudget.tr()
              : LocaleKeys.assistantResult.tr(),
      flow,
    );
  }

  void _onAnother() {
    _seed++;
    final next = _pick();
    setState(() => _set = next);
    HapticFeedback.selectionClick();
  }

  void _onSwap(int index) {
    final set = _set;
    if (set == null) return;
    final line = _assistant.alternativeFor(set, index, seed: ++_seed);
    if (line == null) return;
    setState(() => _set = set.replaceLine(index, line));
    HapticFeedback.selectionClick();
  }

  Future<void> _onAddAll() async {
    final set = _set;
    final addToBasket = widget.onAddToBasket;
    if (set == null || set.isEmpty || _adding || addToBasket == null) return;
    setState(() => _adding = true);
    HapticFeedback.mediumImpact();

    await _fly.forward();
    if (!mounted) return;

    for (final line in set.lines) {
      final added = await addToBasket(context, line.item, line.count);
      if (!mounted) return;
      if (!added) break;
    }
    _close();
  }

  Future<void> _close() async {
    if (_closing) return;
    _closing = true;
    _flow++;
    _idle?.cancel();
    await _presence.reverse();
    if (mounted) widget.onClose();
  }

  /// Собственный таймер простоя: если в меню нет скринсейвера, реклама не
  /// закроет помощника, и следующий гость увидел бы чужой диалог.
  void _restartIdle() {
    _idle?.cancel();
    _idle = Timer(widget.idleTimeout, _close);
  }

  void _onLineTyped() {
    if (!mounted) return;
    setState(() => _lineDone = true);
    // Ждём, пока варианты или подборка развернутся (AnimatedSize), и
    // докручиваем к ним: длинная подборка не должна прятаться под доком.
    final flow = _flow;
    Future<void>.delayed(const Duration(milliseconds: 450), () {
      if (!mounted || flow != _flow || !_scroll.hasClients) return;
      _scroll.animateTo(
        _scroll.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      );
    });
  }

  // --------------------------------------------------------------------------
  // Вёрстка
  // --------------------------------------------------------------------------

  double get _energy {
    if (_adding || _step == _Step.thinking) return 1;
    if (_line.isEmpty) return 0.6;
    return 0.2;
  }

  @override
  Widget build(BuildContext context) {
    final presence = _presenceCurve;
    final showResult =
        _step == _Step.result && _lineDone && !(_set?.isEmpty ?? true);
    final compact = MediaQuery.sizeOf(context).height < _compactHeight;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _close();
      },
      child: Listener(
        onPointerDown: (_) => _restartIdle(),
        child: FadeTransition(
          opacity: presence,
          child: Material(
            type: MaterialType.transparency,
            child: Stack(
              fit: StackFit.expand,
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0, -1.1),
                      radius: 1.4,
                      colors: [
                        AssistantPalette.backgroundTop,
                        AssistantPalette.background,
                      ],
                    ),
                  ),
                ),
                IgnorePointer(
                  child: RepaintBoundary(
                    child: AssistantGlowBorder(
                      energy: _step == _Step.thinking || _adding ? 1 : 0.35,
                      radius: 0,
                      glowWidth: 140,
                      glowOpacity: 0.45,
                    ),
                  ),
                ),
                SafeArea(
                  minimum: const EdgeInsets.all(24),
                  child: AnimatedBuilder(
                    animation: presence,
                    builder: (context, child) => Transform.translate(
                      offset: Offset(0, 40 * (1 - presence.value)),
                      child: child,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: compact ? 1100 : 880,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: _CloseButton(onTap: _close),
                            ),
                            Expanded(child: _buildStage(showResult, compact)),
                            _buildDock(showResult, compact),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Сфера, ответы, реплика и то, что под ней. Пока всё помещается —
  /// стоит по центру экрана, длинная подборка прокручивается.
  Widget _buildStage(bool showResult, bool compact) {
    final body = _buildBody(showResult, compact);
    final gap = compact ? 12.0 : 20.0;

    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        controller: _scroll,
        // Запас сверху и снизу — под свечение сферы и карточек.
        padding: const EdgeInsets.symmetric(vertical: _stagePadding),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: math.max(0, constraints.maxHeight - _stagePadding * 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 900),
                curve: Curves.elasticOut,
                builder: (context, t, child) =>
                    Transform.scale(scale: t, child: child),
                child: AssistantOrb(size: compact ? 88 : 132, energy: _energy),
              ),
              SizedBox(height: gap),
              _AnswersTrail(answers: _answers),
              SizedBox(height: gap),
              SizedBox(
                width: double.infinity,
                child: _line.isEmpty
                    ? const _TypingDots()
                    : _Typewriter(
                        key: ValueKey('${_flow}_$_line'),
                        text: _line,
                        onDone: _onLineTyped,
                      ),
              ),
              SizedBox(height: gap + 12),
              // Без обрезки: SizeTransition резал бы свечение барабана и
              // карточки, взлетающие перед полётом в корзину.
              AnimatedSize(
                duration: const Duration(milliseconds: 380),
                curve: Curves.easeOutCubic,
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeOutCubic,
                  switchOutCurve: Curves.easeInCubic,
                  layoutBuilder: (current, previous) => Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [...previous, if (current != null) current],
                  ),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: Tween(begin: 0.96, end: 1.0).animate(animation),
                      child: child,
                    ),
                  ),
                  child: KeyedSubtree(
                    key: body.key,
                    child: SizedBox(width: double.infinity, child: body),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(bool showResult, bool compact) {
    if (_step == _Step.thinking) {
      return _DishReel(
        key: const ValueKey('reel'),
        items: _assistant.reelItems(seed: _seed),
        hero: _set?.lines
            .map((l) => l.item)
            .where((i) => i.image?.isNotEmpty ?? false)
            .firstOrNull,
        total: _assistant.dishCount,
        duration: _reelDuration,
        notes: [for (final note in _set?.notes ?? const []) _noteText(note)],
      );
    }
    if (showResult) {
      final set = _set!;
      return Column(
        key: const ValueKey('result'),
        children: [
          if (set.guests > 1) ...[
            _InsightChip(
              text: LocaleKeys.assistantPerPerson.tr(
                namedArgs: {'price': priceFormat('${set.perPerson}')},
              ),
            ),
            SizedBox(height: compact ? 12 : 20),
          ],
          _ResultGrid(
            set: set,
            fly: _fly,
            canSwap: (i) => _assistant.hasAlternative(set, i),
            onSwap: _onSwap,
            compact: compact,
          ),
        ],
      );
    }
    if (!_lineDone) return const SizedBox(key: ValueKey('none'));

    final choices = switch (_step) {
      _Step.mood => [
          for (final mood in _assistant.moods)
            _Choice(
              _moodEmoji(mood),
              _moodLabel(mood),
              (l) => _onMood(mood, l),
            ),
        ],
      _Step.guests => [
          _Choice(
              null, LocaleKeys.assistantGuestsOne.tr(), (l) => _onGuests(1, l)),
          _Choice(
              null, LocaleKeys.assistantGuestsTwo.tr(), (l) => _onGuests(2, l)),
          _Choice(null, LocaleKeys.assistantGuestsThree.tr(),
              (l) => _onGuests(3, l)),
          _Choice(null, LocaleKeys.assistantGuestsFour.tr(),
              (l) => _onGuests(4, l)),
        ],
      _Step.preference => [
          for (final preference in _preferences)
            _Choice(
              _preferenceEmoji(preference),
              _preferenceLabel(preference),
              (l) => _onPreference(preference, l),
            ),
        ],
      _Step.budget => [
          for (final preset in _budgetPresets)
            _Choice(
              null,
              LocaleKeys.assistantBudgetUpTo.tr(
                namedArgs: {'price': priceFormat('$preset')},
              ),
              (l) => _onBudget(preset, l),
            ),
          _Choice(null, LocaleKeys.assistantBudgetAny.tr(),
              (l) => _onBudget(null, l)),
        ],
      _Step.thinking || _Step.result => const <_Choice>[],
    };

    return _ChoiceWrap(key: ValueKey(_step), choices: choices);
  }

  static String _moodEmoji(AssistantMood mood) => switch (mood) {
        AssistantMood.hearty => '🍽️',
        AssistantMood.light => '🥗',
        AssistantMood.sweet => '🍰',
        AssistantMood.drinks => '🥤',
        AssistantMood.coffee => '☕',
        AssistantMood.tea => '🍵',
        AssistantMood.hot => '🔥',
        AssistantMood.cold => '🧊',
        AssistantMood.noCoffee => '🧃',
        AssistantMood.surprise => '🎲',
      };

  static String _moodLabel(AssistantMood mood) => switch (mood) {
        AssistantMood.hearty => LocaleKeys.assistantMoodHearty.tr(),
        AssistantMood.light => LocaleKeys.assistantMoodLight.tr(),
        AssistantMood.sweet => LocaleKeys.assistantMoodSweet.tr(),
        AssistantMood.drinks => LocaleKeys.assistantMoodDrinks.tr(),
        AssistantMood.coffee => LocaleKeys.assistantMoodCoffee.tr(),
        AssistantMood.tea => LocaleKeys.assistantMoodTea.tr(),
        AssistantMood.hot => LocaleKeys.assistantMoodHot.tr(),
        AssistantMood.cold => LocaleKeys.assistantMoodCold.tr(),
        AssistantMood.noCoffee => LocaleKeys.assistantMoodNoCoffee.tr(),
        AssistantMood.surprise => LocaleKeys.assistantMoodSurprise.tr(),
      };

  static String _preferenceEmoji(AssistantPreference preference) =>
      switch (preference) {
        AssistantPreference.spicy => '🌶️',
        AssistantPreference.mild => '🥛',
        AssistantPreference.noMeat => '🥦',
        AssistantPreference.none => '👌',
      };

  static String _preferenceLabel(AssistantPreference preference) =>
      switch (preference) {
        AssistantPreference.spicy => LocaleKeys.assistantPrefSpicy.tr(),
        AssistantPreference.mild => LocaleKeys.assistantPrefMild.tr(),
        AssistantPreference.noMeat => LocaleKeys.assistantPrefNoMeat.tr(),
        AssistantPreference.none => LocaleKeys.assistantPrefNone.tr(),
      };

  static String _timeLabel(AssistantTime time) => switch (time) {
        AssistantTime.morning => LocaleKeys.assistantTimeMorning.tr(),
        AssistantTime.day => LocaleKeys.assistantTimeDay.tr(),
        AssistantTime.evening => LocaleKeys.assistantTimeEvening.tr(),
        AssistantTime.night => LocaleKeys.assistantTimeNight.tr(),
      };

  /// Шаг анализа — то, что помощник действительно учёл в этом подборе.
  static String _noteText(AssistantNote note) => switch (note.kind) {
        AssistantNoteKind.menu => LocaleKeys.assistantNoteMenu.tr(
            namedArgs: {'count': '${note.value ?? 0}'},
          ),
        AssistantNoteKind.time => LocaleKeys.assistantNoteTime.tr(
            namedArgs: {'time': _timeLabel(note.time ?? AssistantTime.day)},
          ),
        AssistantNoteKind.cold => LocaleKeys.assistantNoteCold.tr(),
        AssistantNoteKind.hot => LocaleKeys.assistantNoteHot.tr(),
        AssistantNoteKind.preference => LocaleKeys.assistantNotePreference.tr(
            namedArgs: {
              'pref': _preferenceLabel(
                note.preference ?? AssistantPreference.none,
              ).toLowerCase(),
            },
          ),
        AssistantNoteKind.portions => LocaleKeys.assistantNotePortions.tr(),
        AssistantNoteKind.pairing => LocaleKeys.assistantNotePairing.tr(),
        AssistantNoteKind.budget => LocaleKeys.assistantNoteBudget.tr(
            namedArgs: {'price': priceFormat('${note.value ?? 0}')},
          ),
      };

  Widget _buildDock(bool showResult, bool compact) {
    final set = _set;
    final emptyResult =
        _step == _Step.result && _lineDone && set != null && set.isEmpty;
    final visible = showResult || emptyResult;

    Widget? primary;
    if (showResult) {
      primary = widget.onAddToBasket != null
          ? _AddAllButton(total: set!.total, busy: _adding, onTap: _onAddAll)
          : _TotalLabel(total: set!.total);
    }
    final secondary = [
      if (showResult)
        _GhostButton(
          icon: Icons.shuffle_rounded,
          label: LocaleKeys.assistantAnother.tr(),
          onTap: _adding ? null : _onAnother,
        ),
      _GhostButton(
        icon: Icons.refresh_rounded,
        label: LocaleKeys.assistantRestart.tr(),
        onTap: _adding ? null : _start,
      ),
    ];

    Widget buttons;
    if (compact && primary != null) {
      // Альбом: всё в одну строку, чтобы не съедать высоту у подборки.
      buttons = Row(
        children: [
          for (final button in secondary) ...[
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 280),
              child: button,
            ),
            const SizedBox(width: 16),
          ],
          const SizedBox(width: 4),
          Expanded(child: primary),
        ],
      );
    } else {
      buttons = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (primary != null) ...[primary, const SizedBox(height: 24)],
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: secondary,
          ),
        ],
      );
    }
    // Воздух сверху — от карточек, снизу — от края экрана и полосы «домой».
    final dock = Padding(
      key: const ValueKey('dock'),
      padding: const EdgeInsets.only(top: 20, bottom: 16),
      child: buttons,
    );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween(begin: const Offset(0, 0.4), end: Offset.zero)
              .animate(animation),
          child: child,
        ),
      ),
      child: visible
          ? dock
          : const SizedBox(key: ValueKey('no_dock'), width: double.infinity),
    );
  }
}

// ----------------------------------------------------------------------------
// Реплики
// ----------------------------------------------------------------------------

/// Реплика помощника, которая «печатается» по буквам.
class _Typewriter extends StatefulWidget {
  const _Typewriter({super.key, required this.text, required this.onDone});

  final String text;
  final VoidCallback onDone;

  @override
  State<_Typewriter> createState() => _TypewriterState();
}

class _TypewriterState extends State<_Typewriter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 22 * widget.text.characters.length),
  )..forward().whenComplete(widget.onDone);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final characters = widget.text.characters;
    final style = AppTextStyles.headingH1.copyWith(
      fontSize: 20.sp,
      height: 1.25,
      color: AssistantPalette.text,
    );

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final shown = (characters.length * _controller.value).ceil();
        // Невидимый хвост держит высоту блока: текст не прыгает по строкам,
        // пока печатается.
        return Text.rich(
          TextSpan(children: [
            TextSpan(text: characters.take(shown).toString()),
            TextSpan(
              text: characters.skip(shown).toString(),
              style: const TextStyle(color: Colors.transparent),
            ),
          ]),
          textAlign: TextAlign.center,
          style: style,
        );
      },
    );
  }
}

class _TypingDots extends StatefulWidget {
  const _TypingDots();

  @override
  State<_TypingDots> createState() => _TypingDotsState();
}

class _TypingDotsState extends State<_TypingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.sp * 1.25,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Opacity(
                  opacity: 0.3 +
                      0.7 *
                          ((math.sin((_controller.value - i * 0.18) *
                                      2 *
                                      math.pi) +
                                  1) /
                              2),
                  child: const SizedBox.square(
                    dimension: 14,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AssistantPalette.text,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Ответы гостя строкой: «Сытно поесть · Двое · До 9 000 ₸».
class _AnswersTrail extends StatelessWidget {
  const _AnswersTrail({required this.answers});

  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      clipBehavior: Clip.none,
      child: answers.isEmpty
          ? const SizedBox(width: double.infinity)
          : Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final answer in answers)
                  _StaggerIn(
                    index: 0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AssistantPalette.surface,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: AssistantPalette.outline),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        child: Text(
                          answer,
                          style: AppTextStyles.bodyMStrong.copyWith(
                            fontSize: 13.sp,
                            color: AssistantPalette.textSoft,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}

// ----------------------------------------------------------------------------
// Варианты ответа
// ----------------------------------------------------------------------------

class _Choice {
  const _Choice(this.emoji, this.label, this.onTap);

  final String? emoji;
  final String label;
  final void Function(String label) onTap;
}

class _ChoiceWrap extends StatefulWidget {
  const _ChoiceWrap({super.key, required this.choices});

  final List<_Choice> choices;

  @override
  State<_ChoiceWrap> createState() => _ChoiceWrapState();
}

class _ChoiceWrapState extends State<_ChoiceWrap> {
  /// Один ответ на вопрос: повторные касания, пока панель гаснет, глотаем.
  bool _answered = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 14,
      runSpacing: 14,
      children: [
        for (var i = 0; i < widget.choices.length; i++)
          _StaggerIn(
            index: i,
            child: _ChoiceChip(
              choice: widget.choices[i],
              onTap: () {
                if (_answered) return;
                _answered = true;
                widget.choices[i].onTap(widget.choices[i].label);
              },
            ),
          ),
      ],
    );
  }
}

class _ChoiceChip extends StatefulWidget {
  const _ChoiceChip({required this.choice, required this.onTap});

  final _Choice choice;
  final VoidCallback onTap;

  @override
  State<_ChoiceChip> createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<_ChoiceChip> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final emoji = widget.choice.emoji;
    final foreground =
        _pressed ? AssistantPalette.background : AssistantPalette.text;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _pressed ? 0.95 : 1,
        duration: const Duration(milliseconds: 120),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          constraints: const BoxConstraints(minHeight: 76),
          padding: EdgeInsets.fromLTRB(emoji == null ? 32 : 22, 14, 32, 14),
          decoration: BoxDecoration(
            color: _pressed ? AssistantPalette.text : AssistantPalette.surface,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AssistantPalette.outline),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (emoji != null) ...[
                Text(emoji, style: TextStyle(fontSize: 18.sp)),
                const SizedBox(width: 12),
              ],
              Flexible(
                child: Text(
                  widget.choice.label,
                  style: AppTextStyles.bodyLStrong.copyWith(
                    fontSize: 15.sp,
                    color: foreground,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Появление снизу с задержкой по индексу — элементы «выкатываются» по
/// одному, а не все разом.
class _StaggerIn extends StatefulWidget {
  const _StaggerIn({required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  State<_StaggerIn> createState() => _StaggerInState();
}

class _StaggerInState extends State<_StaggerIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 420),
  );
  late final CurvedAnimation _curve =
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
  Timer? _delay;

  @override
  void initState() {
    super.initState();
    _delay = Timer(
      Duration(milliseconds: 70 * widget.index),
      () => _controller.forward(),
    );
  }

  @override
  void dispose() {
    _delay?.cancel();
    _curve.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: AnimatedBuilder(
        animation: _curve,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, 24 * (1 - _curve.value)),
          child: Transform.scale(
            scale: 0.85 + 0.15 * _curve.value,
            child: child,
          ),
        ),
        child: widget.child,
      ),
    );
  }
}

// ----------------------------------------------------------------------------
// «Думает»: барабан с блюдами
// ----------------------------------------------------------------------------

/// Фото блюд мелькают всё медленнее и останавливаются на главном блюде
/// подборки — как барабан игрового автомата.
///
/// Все картинки смонтированы сразу в [IndexedStack]: смена кадра мгновенная,
/// без плейсхолдера, который мигал бы при смене URL у одной картинки.
class _DishReel extends StatefulWidget {
  const _DishReel({
    super.key,
    required this.items,
    required this.hero,
    required this.total,
    required this.duration,
    this.notes = const [],
  });

  final List<Items> items;
  final Items? hero;

  /// Сколько всего блюд «проверяет» помощник — для счётчика.
  final int total;
  final Duration duration;

  /// Шаги анализа, сменяют друг друга под счётчиком.
  final List<String> notes;

  @override
  State<_DishReel> createState() => _DishReelState();
}

class _DishReelState extends State<_DishReel>
    with SingleTickerProviderStateMixin {
  static const double _size = 300;

  late final List<Items> _frames = [
    ...widget.items.where((i) => i.id != widget.hero?.id),
    if (widget.hero != null) widget.hero!,
  ];

  late final AnimationController _scan;

  Timer? _timer;
  int _index = 0;
  double _interval = 60;
  int _elapsed = 0;
  bool _landed = false;

  @override
  void initState() {
    super.initState();
    _scan = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    if (_frames.length > 1) {
      _scan.repeat();
      _timer = Timer(Duration(milliseconds: _interval.round()), _next);
    } else {
      _landed = true;
    }
  }

  void _next() {
    if (!mounted) return;
    _elapsed += _interval.round();
    // Последние ~350 мс — на главном блюде, с «приземлением».
    if (_elapsed >= widget.duration.inMilliseconds - 350) {
      setState(() {
        _index = _frames.length - 1;
        _landed = true;
      });
      _scan.stop();
      HapticFeedback.lightImpact();
      return;
    }
    setState(() => _index = (_index + 1) % math.max(1, _frames.length - 1));
    _interval = math.min(_interval * 1.12, 260);
    _timer = Timer(Duration(milliseconds: _interval.round()), _next);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scan.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progress = _landed
        ? 1.0
        : (_elapsed / widget.duration.inMilliseconds).clamp(0.0, 1.0);
    final checked = (widget.total * progress).round();

    return Column(
      children: [
        AnimatedScale(
          scale: _landed ? 1.06 : 1,
          duration: const Duration(milliseconds: 380),
          curve: Curves.elasticOut,
          child: SizedBox.square(
            dimension: _size,
            child: AssistantGlowBorder(
              radius: 36,
              glowWidth: 44,
              glowOpacity: 0.8,
              energy: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ColoredBox(color: AssistantPalette.surface),
                    if (_frames.isNotEmpty)
                      IndexedStack(
                        index: _index,
                        sizing: StackFit.expand,
                        children: [
                          for (final item in _frames)
                            _DishImage(item: item, padding: 28),
                        ],
                      ),
                    if (!_landed)
                      AnimatedBuilder(
                        animation: _scan,
                        builder: (context, _) => Align(
                          alignment: Alignment(0, -1.4 + 2.8 * _scan.value),
                          child: Container(
                            height: 90,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white.withValues(alpha: 0),
                                  Colors.white.withValues(alpha: 0.28),
                                  Colors.white.withValues(alpha: 0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '$checked / ${widget.total}',
          style: AppTextStyles.bodyLStrong.copyWith(
            fontSize: 15.sp,
            color: AssistantPalette.textSoft,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
        if (widget.notes.isNotEmpty) ...[
          const SizedBox(height: 14),
          _NotesTicker(notes: widget.notes, duration: widget.duration),
        ],
      ],
    );
  }
}

/// Фото блюда целиком. Не `cover`: в квадрате барабана и в карточке он
/// срезал края у высоких бутылок и широких тарелок.
class _DishImage extends StatelessWidget {
  const _DishImage({required this.item, required this.padding});

  final Items item;

  /// Отступ фото от краёв рамки.
  final double padding;

  @override
  Widget build(BuildContext context) {
    final images = item.image;
    final url = images == null || images.isEmpty
        ? ''
        : resolveImageDatumUrl(images.first);
    final placeholder = ColoredBox(
      color: AssistantPalette.surface,
      child: Center(child: Text('🍽️', style: TextStyle(fontSize: 28.sp))),
    );
    if (url.isEmpty) return placeholder;

    return SafeNetworkImage(
      imageUrl: url,
      cacheWidth: 360,
      placeholder: placeholder,
      errorWidget: placeholder,
      imageBuilder: (context, image) => Padding(
        padding: EdgeInsets.all(padding),
        child: Image(
          image: image,
          fit: BoxFit.contain,
          gaplessPlayback: true,
        ),
      ),
    );
  }
}

/// Шаги анализа под барабаном: «Учитываю время суток: вечер», «Подбираю
/// блюда, которые сочетаются» — сменяют друг друга за время вращения.
class _NotesTicker extends StatefulWidget {
  const _NotesTicker({required this.notes, required this.duration});

  final List<String> notes;
  final Duration duration;

  @override
  State<_NotesTicker> createState() => _NotesTickerState();
}

class _NotesTickerState extends State<_NotesTicker> {
  Timer? _timer;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    final step = widget.duration.inMilliseconds ~/ widget.notes.length;
    _timer = Timer.periodic(Duration(milliseconds: step), (timer) {
      if (_index >= widget.notes.length - 1) {
        timer.cancel();
        return;
      }
      setState(() => _index++);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 260),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween(begin: const Offset(0, 0.4), end: Offset.zero)
              .animate(animation),
          child: child,
        ),
      ),
      child: Text(
        widget.notes[_index],
        key: ValueKey(_index),
        textAlign: TextAlign.center,
        style: AppTextStyles.bodyM.copyWith(
          fontSize: 14.sp,
          color: AssistantPalette.textSoft,
        ),
      ),
    );
  }
}

/// Плашка-итог над подборкой: «≈ 5 200 ₸ на человека».
class _InsightChip extends StatelessWidget {
  const _InsightChip({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AssistantPalette.surface,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          text,
          style: AppTextStyles.bodyMStrong.copyWith(
            fontSize: 14.sp,
            color: AssistantPalette.text,
          ),
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------------
// Результат
// ----------------------------------------------------------------------------

class _ResultGrid extends StatelessWidget {
  const _ResultGrid({
    required this.set,
    required this.fly,
    required this.canSwap,
    required this.onSwap,
    required this.compact,
  });

  final AssistantSet set;
  final Animation<double> fly;
  final bool Function(int index) canSwap;
  final void Function(int index) onSwap;
  final bool compact;

  static const double _gap = 16;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = (constraints.maxWidth / 250).floor().clamp(2, 4);
        final width = (constraints.maxWidth - _gap * (columns - 1)) / columns;
        final count = set.lines.length;

        return Wrap(
          alignment: WrapAlignment.center,
          spacing: _gap,
          runSpacing: _gap,
          children: [
            for (var i = 0; i < count; i++)
              _StaggerIn(
                index: i,
                child: _FlyAway(
                  animation: fly,
                  index: i,
                  count: count,
                  child: SizedBox(
                    width: width,
                    child: _FlipSwitcher(
                      child: _DishCard(
                        key: ValueKey(set.lines[i].item.id),
                        line: set.lines[i],
                        onSwap: canSwap(i) ? () => onSwap(i) : null,
                        compact: compact,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

/// Карточки по очереди улетают вниз — к кнопке заказа — и тают.
class _FlyAway extends StatelessWidget {
  const _FlyAway({
    required this.animation,
    required this.index,
    required this.count,
    required this.child,
  });

  final Animation<double> animation;
  final int index;
  final int count;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final start = count <= 1 ? 0.0 : 0.4 * index / (count - 1);
    final interval = Interval(start, start + 0.6, curve: Curves.easeInBack);
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        // easeInBack сначала чуть уводит вверх — «замах» перед броском.
        final t = interval.transform(animation.value);
        if (t == 0) return child!;
        return Opacity(
          opacity: (1 - t).clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(0, 600 * t),
            child: Transform.scale(
              scale: 1 - 0.6 * t.clamp(0.0, 1.0),
              child: child,
            ),
          ),
        );
      },
    );
  }
}

/// Замена блюда — карточка переворачивается: первую половину времени старая
/// уходит ребром, вторую — новая выходит из ребра.
class _FlipSwitcher extends StatelessWidget {
  const _FlipSwitcher({required this.child});

  final Widget child;

  static const _half = Interval(0.5, 1, curve: Curves.easeOutCubic);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 560),
      layoutBuilder: (current, previous) => Stack(
        alignment: Alignment.topCenter,
        children: [...previous, if (current != null) current],
      ),
      // У входящей карточки анимация идёт 0→1, у уходящей — 1→0, поэтому
      // одна и та же формула даёт обе половины переворота.
      transitionBuilder: (child, animation) => AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (context, child) {
          final shown = _half.transform(animation.value);
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0012)
              ..rotateY((1 - shown) * math.pi / 2),
            child: Opacity(opacity: shown == 0 ? 0 : 1, child: child),
          );
        },
      ),
      child: child,
    );
  }
}

class _DishCard extends StatelessWidget {
  const _DishCard({
    super.key,
    required this.line,
    required this.onSwap,
    required this.compact,
  });

  final AssistantLine line;
  final VoidCallback? onSwap;

  /// Невысокий экран: фото площе.
  final bool compact;

  /// Почему блюдо выбрано; если особой причины нет — просто его роль, а
  /// если и роль не узнали — категория из меню. Пусто — подписать нечем.
  String get _tag {
    final reason = line.reason;
    if (reason != null) {
      return switch (reason) {
        AssistantReason.hit => LocaleKeys.assistantTagHit.tr(),
        AssistantReason.signature => LocaleKeys.assistantReasonSignature.tr(),
        AssistantReason.shared => LocaleKeys.assistantReasonShared.tr(),
        AssistantReason.pairing => LocaleKeys.assistantReasonPairing.tr(),
        AssistantReason.warming => LocaleKeys.assistantReasonWarming.tr(),
        AssistantReason.refreshing => LocaleKeys.assistantReasonRefreshing.tr(),
        AssistantReason.morning => LocaleKeys.assistantReasonMorning.tr(),
        AssistantReason.spicy => LocaleKeys.assistantReasonSpicy.tr(),
        AssistantReason.light => LocaleKeys.assistantReasonLight.tr(),
        AssistantReason.hearty => LocaleKeys.assistantReasonHearty.tr(),
        AssistantReason.newItem => LocaleKeys.assistantReasonNew.tr(),
      };
    }
    return switch (line.role) {
      DishRole.main || DishRole.extra => LocaleKeys.assistantTagMain.tr(),
      DishRole.other => formatMenuItemTitle(line.dish.category),
      DishRole.soup => LocaleKeys.assistantTagSoup.tr(),
      DishRole.salad => LocaleKeys.assistantTagSalad.tr(),
      DishRole.starter => LocaleKeys.assistantTagStarter.tr(),
      DishRole.side => LocaleKeys.assistantTagSide.tr(),
      DishRole.drink => LocaleKeys.assistantTagDrink.tr(),
      DishRole.dessert => LocaleKeys.assistantTagDessert.tr(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final tag = _tag;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AssistantPalette.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AssistantPalette.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: compact ? 16 / 9 : 4 / 3,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(24)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _DishImage(item: line.item, padding: 14),
                  if (line.count > 1)
                    Positioned(
                      left: 12,
                      top: 12,
                      child: _Badge(text: '×${line.count}'),
                    ),
                  if (onSwap != null)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: _SwapButton(onTap: onSwap!),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Без подписи место под ярлык остаётся: карточки в ряду одной
                // высоты.
                Visibility.maintain(
                  visible: tag.isNotEmpty,
                  child: _TagPill(
                    text: tag.isEmpty ? ' ' : tag,
                    highlighted: line.reason != null,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  // Две строки названия всегда: карточки в ряду одной высоты.
                  height: 14.sp * 1.25 * 2,
                  child: Text(
                    formatMenuItemTitle(line.item.name),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyLStrong.copyWith(
                      fontSize: 14.sp,
                      height: 1.25,
                      color: AssistantPalette.text,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${priceFormat('${line.unitPrice}')} ₸',
                  style: AppTextStyles.bodyLStrong.copyWith(
                    fontSize: 15.sp,
                    color: AssistantPalette.textSoft,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TagPill extends StatelessWidget {
  const _TagPill({required this.text, required this.highlighted});

  final String text;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: highlighted
            ? const LinearGradient(
                colors: [AssistantPalette.coral, AssistantPalette.amber],
              )
            : null,
        color: highlighted ? null : AssistantPalette.surface,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        // Категория из меню бывает длинной — в одну строку.
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodySstrong.copyWith(
            fontSize: 12.sp,
            color: AssistantPalette.text,
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          text,
          style: AppTextStyles.bodyLStrong.copyWith(
            fontSize: 13.sp,
            color: AssistantPalette.text,
          ),
        ),
      ),
    );
  }
}

class _SwapButton extends StatelessWidget {
  const _SwapButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        // Зона касания шире самой кнопки — палец на киоске толстый.
        padding: const EdgeInsets.all(4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.55),
            shape: BoxShape.circle,
          ),
          child: const SizedBox.square(
            dimension: 52,
            child: Icon(
              Icons.autorenew_rounded,
              color: AssistantPalette.text,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}

// ----------------------------------------------------------------------------
// Кнопки дока
// ----------------------------------------------------------------------------

class _AddAllButton extends StatelessWidget {
  const _AddAllButton({
    required this.total,
    required this.busy,
    required this.onTap,
  });

  final int total;
  final bool busy;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.bodyLStrong.copyWith(
      fontSize: 16.sp,
      color: AssistantPalette.background,
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: busy ? null : onTap,
      // Без свечения: белая кнопка на тёмном фоне и так главный акцент.
      child: Container(
        height: 88,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
          color: AssistantPalette.text,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                LocaleKeys.assistantAddAll.tr(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: style,
              ),
            ),
            _AnimatedPrice(value: total, style: style),
          ],
        ),
      ),
    );
  }
}

class _TotalLabel extends StatelessWidget {
  const _TotalLabel({required this.total});

  final int total;

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.bodyLStrong.copyWith(
      fontSize: 16.sp,
      color: AssistantPalette.text,
    );
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text('${LocaleKeys.total.tr()}: ', style: style),
        _AnimatedPrice(value: total, style: style),
      ],
    );
  }
}

/// Сумма «докручивается» до нового значения при замене блюд.
class _AnimatedPrice extends StatelessWidget {
  const _AnimatedPrice({required this.value, required this.style});

  final int value;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(end: value.toDouble()),
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeOutCubic,
      builder: (context, v, _) => Text(
        '${priceFormat('${v.round()}')} ₸',
        style: style.copyWith(
          fontFeatures: const [FontFeature.tabularFigures()],
        ),
      ),
    );
  }
}

class _GhostButton extends StatelessWidget {
  const _GhostButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedOpacity(
        opacity: onTap == null ? 0.4 : 1,
        duration: const Duration(milliseconds: 200),
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 26),
          decoration: BoxDecoration(
            color: AssistantPalette.surface,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AssistantPalette.outline),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AssistantPalette.text, size: 26),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyLStrong.copyWith(
                    fontSize: 14.sp,
                    color: AssistantPalette.text,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AssistantPalette.surface,
          shape: BoxShape.circle,
          border: Border.all(color: AssistantPalette.outline),
        ),
        child: const SizedBox.square(
          dimension: 64,
          child: Icon(
            Icons.close_rounded,
            color: AssistantPalette.text,
            size: 32,
          ),
        ),
      ),
    );
  }
}
