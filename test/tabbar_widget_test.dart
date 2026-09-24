import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/core/resources/localization_loader.g.dart';
import 'package:qr_pay_app/src/features/home/widgets/tabbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

/// Табы «В зале / С собой» в альбоме живут в узкой панели корзины, и на
/// половину её ширины казахское «Өзіңізбен бірге» не помещается.
///
/// Переводы обязательны: на голых ключах ('takeaway') подписи короче и
/// переполнение не воспроизводится.
Future<void> pumpTabs(
  WidgetTester tester, {
  required double width,
  required Locale locale,
}) async {
  tester.view.physicalSize = const Size(1366, 1024);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  final controller = TabController(length: 2, vsync: const TestVSync());
  addTearDown(controller.dispose);

  await tester.pumpWidget(
    EasyLocalization(
      supportedLocales: const [Locale('kk', 'KK'), Locale('ru', 'RU')],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      startLocale: locale,
      child: Sizer(
        builder: (context, orientation, screenType) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: width,
                child: TabbarWidget(
                  tabController: controller,
                  isTablet: true,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// Поднимает дерево, в котором таб-бар можно убрать, не трогая контроллер —
/// ровно то, что происходит при повороте: виджет переезжает из шапки списка
/// в панель корзины.
Future<void> pumpRemovable(
  WidgetTester tester,
  TabController controller, {
  required bool showTabs,
}) async {
  await tester.pumpWidget(
    EasyLocalization(
      supportedLocales: const [Locale('kk', 'KK'), Locale('ru', 'RU')],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      startLocale: const Locale('ru', 'RU'),
      child: Sizer(
        builder: (context, orientation, screenType) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: Scaffold(
            body: showTabs
                ? TabbarWidget(tabController: controller, isTablet: true)
                : const SizedBox.shrink(),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // easy_localization читает сохранённую локаль через SharedPreferences —
    // мок обязан стоять до ensureInitialized.
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  // Ширина панели корзины в альбоме (36% от 1366) минус её паддинги.
  const panelWidth = 1366 * 0.36 - 32;

  for (final locale in const [Locale('kk', 'KK'), Locale('ru', 'RU')]) {
    testWidgets('подписи табов помещаются в панель: ${locale.languageCode}',
        (tester) async {
      await pumpTabs(tester, width: panelWidth, locale: locale);

      expect(find.byType(TabbarWidget), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('подписи табов помещаются и в совсем узкой панели',
      (tester) async {
    await pumpTabs(tester, width: 320, locale: const Locale('kk', 'KK'));

    expect(tester.takeException(), isNull);
  });

  testWidgets('убранный таб-бар отписывается от контроллера', (tester) async {
    final controller = TabController(length: 2, vsync: const TestVSync());
    addTearDown(controller.dispose);

    await pumpRemovable(tester, controller, showTabs: true);
    expect(find.byType(TabbarWidget), findsOneWidget);

    // Виджета в дереве больше нет, но контроллер жив — он принадлежит
    // экрану корзины и переживает поворот.
    await pumpRemovable(tester, controller, showTabs: false);
    expect(find.byType(TabbarWidget), findsNothing);

    controller.index = 1;
    await tester.pumpAndSettle();

    // Без отписки здесь прилетает setState() called after dispose().
    expect(tester.takeException(), isNull);
  });

  testWidgets('пересозданный таб-бар сохраняет выбранную вкладку',
      (tester) async {
    final controller = TabController(length: 2, vsync: const TestVSync());
    addTearDown(controller.dispose);

    await pumpRemovable(tester, controller, showTabs: true);
    controller.index = 1;
    await tester.pumpAndSettle();

    // Поворот: виджет уничтожается и создаётся заново на новом месте.
    await pumpRemovable(tester, controller, showTabs: false);
    await pumpRemovable(tester, controller, showTabs: true);

    final state = tester.state<State<TabbarWidget>>(find.byType(TabbarWidget));
    expect((state as dynamic).index, 1);
    expect(tester.takeException(), isNull);
  });
}
