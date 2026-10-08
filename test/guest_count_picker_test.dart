import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/vm/service/basket_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/menu_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/scroll_service.dart';
import 'package:qr_pay_app/src/features/home/vm/service/video_service.dart';
import 'package:qr_pay_app/src/features/home/widgets/additions.dart';
import 'package:qr_pay_app/src/features/home/widgets/guest_count_picker.dart';
import 'package:sizer/sizer.dart';

/// Соус к хого — как в меню ресторана: обязательный, по умолчанию один.
Modifier _sauce() => Modifier(
      id: 1971,
      name: 'Дополнительно',
      min: 1,
      max: 50,
      required: true,
      multiple: true,
      items: [
        Items(
          id: 136914,
          name: '-1гость=1 соус',
          price: 1000,
          defaultSelect: true,
          requiredSelect: true,
        ),
      ],
    );

Modifier _flavors() => Modifier(
      id: 1944,
      name: 'Укажите остроту бульона',
      min: 2,
      max: 2,
      required: true,
      multiple: true,
      items: [
        Items(id: 136548, name: 'Грибной бульон', price: 0),
        Items(id: 136551, name: 'Белый костный бульон', price: 0),
      ],
    );

/// Без инициализации easy_localization `.tr()` отдаёт сам ключ.
Future<void> _pump(WidgetTester tester, Widget child) async {
  tester.view.physicalSize = const Size(1080, 1920);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    Sizer(
      builder: (context, orientation, screenType) => MaterialApp(
        home: Builder(
          builder: (context) => ChangeNotifierProvider<QrMenuVm>.value(
            value: QrMenuVm(
              context: context,
              basketService: BasketService(),
              scrollService: ScrollService(),
              videoService: VideoPreviewService(),
              menuDataService: MenuDataService(),
            ),
            child: Scaffold(body: SingleChildScrollView(child: child)),
          ),
        ),
      ),
    ),
  );
}

Finder _svg(String asset) => find.byWidgetPredicate((widget) =>
    widget is SvgPicture &&
    widget.pictureProvider is ExactAssetPicture &&
    (widget.pictureProvider as ExactAssetPicture).assetName == asset);

/// Сама картинка SVG касания не ловит — жмём кнопку вокруг неё.
Finder _button(String asset) => find
    .ancestor(of: _svg(asset), matching: find.byType(GestureDetector))
    .first;

double _opacityOf(WidgetTester tester, Finder svg) => tester
    .widget<Opacity>(
        find.ancestor(of: svg, matching: find.byType(Opacity)).first)
    .opacity;

void main() {
  group('GuestCountPicker', () {
    testWidgets('числа до восьми, дальше — счётчик до максимума',
        (tester) async {
      int? value;
      Future<void> pumpPicker() => _pump(
            tester,
            StatefulBuilder(
              builder: (context, setState) => GuestCountPicker(
                value: value,
                min: 1,
                max: 10,
                onChanged: (v) => setState(() => value = v),
              ),
            ),
          );
      await pumpPicker();

      for (var n = 1; n <= 8; n++) {
        expect(find.text('$n'), findsOneWidget);
      }
      expect(tester.getCenter(find.text('9+')).dy,
          tester.getCenter(find.text('1')).dy,
          reason: 'всё в одну строку');

      await tester.tap(find.text('3'));
      await tester.pump();
      expect(value, 3);
      expect(_svg(AppSvgImages.plus), findsNothing,
          reason: 'счётчика нет, пока не нужен');

      await tester.tap(find.text('9+'));
      await tester.pumpAndSettle();
      expect(value, 9);
      expect(find.text('9'), findsOneWidget, reason: 'число в счётчике');

      await tester.tap(_button(AppSvgImages.plus));
      await tester.pump();
      expect(value, 10);
      expect(_opacityOf(tester, _svg(AppSvgImages.plus)), 0.3,
          reason: 'больше максимума нельзя');

      await tester.tap(_button(AppSvgImages.minus));
      await tester.pump();
      await tester.tap(_button(AppSvgImages.minus));
      await tester.pumpAndSettle();
      expect(value, 8, reason: 'вернулись к числам');
      expect(_svg(AppSvgImages.minus), findsNothing);
    });

    testWidgets('узкий экран — чисел меньше, но без переноса', (tester) async {
      int? value;
      await _pump(
        tester,
        Center(
          child: SizedBox(
            width: 320,
            child: StatefulBuilder(
              builder: (context, setState) => GuestCountPicker(
                value: value,
                min: 1,
                max: 50,
                size: 48,
                onChanged: (v) => setState(() => value = v),
              ),
            ),
          ),
        ),
      );

      expect(find.text('4'), findsOneWidget);
      expect(find.text('5'), findsNothing);
      expect(tester.getCenter(find.text('5+')).dy,
          tester.getCenter(find.text('1')).dy);

      await tester.tap(find.text('5+'));
      await tester.pumpAndSettle();
      expect(value, 5);
    });

    testWidgets('маленький максимум — без «+», меньше минимума нельзя',
        (tester) async {
      final picked = <int>[];
      await _pump(
        tester,
        GuestCountPicker(value: null, min: 2, max: 4, onChanged: picked.add),
      );

      expect(find.text('4'), findsOneWidget);
      expect(find.text('5'), findsNothing);
      expect(find.textContaining('+'), findsNothing);

      await tester.tap(find.text('1'));
      await tester.tap(find.text('2'));
      expect(picked, [2]);
    });
  });

  group('GuestCountDialog', () {
    Future<void> open(WidgetTester tester, ValueNotifier<int?> result) async {
      tester.view.physicalSize = const Size(1080, 1920);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                onPressed: () async => result.value =
                    await GuestCountDialog.show(context,
                        min: 1, max: 50, hint: 'Соус — на каждого гостя'),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
    }

    testWidgets('добавить можно только после ответа', (tester) async {
      final result = ValueNotifier<int?>(-1);
      await open(tester, result);
      expect(find.text(LocaleKeys.guestCountTitle), findsOneWidget);
      expect(find.text('Соус — на каждого гостя'), findsOneWidget);

      await tester.tap(find.text(LocaleKeys.addToOrder));
      await tester.pumpAndSettle();
      expect(find.text(LocaleKeys.guestCountTitle), findsOneWidget,
          reason: 'без ответа не закрывается');

      await tester.tap(find.text('3'));
      await tester.pump();
      await tester.tap(find.text(LocaleKeys.addToOrder));
      await tester.pumpAndSettle();
      expect(result.value, 3);
    });

    testWidgets('отмена — null, тап мимо не закрывает', (tester) async {
      final result = ValueNotifier<int?>(-1);
      await open(tester, result);

      await tester.tapAt(const Offset(2, 2));
      await tester.pumpAndSettle();
      expect(find.text(LocaleKeys.guestCountTitle), findsOneWidget);

      await tester.tap(find.text(LocaleKeys.cancel));
      await tester.pumpAndSettle();
      expect(result.value, isNull);
    });
  });

  group('страница блюда', () {
    testWidgets('вместо «Дополнительно» — «Сколько вас?»', (tester) async {
      final guests = ValueNotifier<int?>(null);
      await _pump(
        tester,
        AdditionsWidget(
          modifierData: [_sauce(), _flavors()],
          guests: guests,
          onGuestsChanged: (v) => guests.value = v,
        ),
      );

      expect(find.text(LocaleKeys.guestCountTitle), findsOneWidget);
      expect(find.text('Дополнительно'), findsNothing);
      expect(find.text('Укажите остроту бульона'), findsOneWidget);
      expect(find.textContaining('1гость=1 соус'), findsOneWidget);

      await tester.tap(find.text('3'));
      await tester.pump();
      expect(guests.value, 3);
    });

    testWidgets('без ответа страницы — обычный счётчик', (tester) async {
      await _pump(
        tester,
        AdditionsWidget(modifierData: [_sauce(), _flavors()]),
      );

      expect(find.text(LocaleKeys.guestCountTitle), findsNothing);
      expect(find.text('Дополнительно'), findsOneWidget);
    });

    testWidgets('обязательную позицию можно уменьшить, но не до нуля',
        (tester) async {
      final selections = <int>[];
      await _pump(
        tester,
        Modifiers(
          items: _sauce().items,
          min: 1,
          max: 50,
          onChanged: (items) => selections.add(items?.length ?? 0),
        ),
      );
      expect(selections.last, 1);
      expect(_opacityOf(tester, _svg(AppSvgImages.minus)), 0.3);

      await tester.tap(_button(AppSvgImages.plus));
      await tester.pump();
      await tester.tap(_button(AppSvgImages.plus));
      await tester.pump();
      expect(selections.last, 3);
      expect(_opacityOf(tester, _svg(AppSvgImages.minus)), 1.0);

      await tester.tap(_button(AppSvgImages.minus));
      await tester.pump();
      expect(selections.last, 2);
      await tester.tap(_button(AppSvgImages.minus));
      await tester.pump();
      expect(selections.last, 1);
      expect(_opacityOf(tester, _svg(AppSvgImages.minus)), 0.3);
    });
  });
}
