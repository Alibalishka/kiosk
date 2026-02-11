import 'dart:async';

import 'package:flutter/services.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_loader.dart';
import 'package:qr_pay_app/src/core/widgets/custom_text_field.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/bloc/kiosk_bloc/kiosk_bloc.dart';
import 'package:qr_pay_app/src/features/kiosk/service/ota_update.dart';
import 'package:qr_pay_app/src/features/kiosk/vm/kiosk_vm.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class KioskRegister extends StatefulWidget {
  const KioskRegister({
    super.key,
    required this.viewModel,
  });

  final KioskVm viewModel;

  @override
  State<KioskRegister> createState() => _KioskRegisterState();
}

class _KioskRegisterState extends State<KioskRegister>
    with ViewModelMixin<KioskRegister, KioskVm> {
  @override
  KioskVm get viewModel => widget.viewModel;

  bool _otaRunning = false;

  // ✅ Channel для DPC
  static const MethodChannel _dpc = MethodChannel('dpc');

  final TextEditingController _confirmController = TextEditingController();
  bool _clearingDo = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.initAndWatchInternet();
    });
  }

  @override
  void dispose() {
    _confirmController.dispose();
    viewModel.disposeVm(); // ✅ важно: закрываем подписки на сеть/таймеры
    super.dispose();
  }

  // ✅ Открыть список Wi-Fi (панель/настройки)
  Future<void> _openWifi() async {
    try {
      await _dpc.invokeMethod('openWifi');
    } on PlatformException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка Wi-Fi: ${e.message ?? e.code}')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка Wi-Fi: $e')),
      );
    }
  }

  Future<void> _runOtaUpdate() async {
    if (_otaRunning) return;

    // ✅ не запускаем OTA без интернета
    if (!viewModel.hasInternet.value) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Нет интернета. Подключите Wi-Fi.')),
      );
      return;
    }

    setState(() => _otaRunning = true);
    try {
      await downloadAndInstallOta();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Обновление запущено…')),
      );
    } on PlatformException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTA ошибка: ${e.message ?? e.code}')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTA ошибка: $e')),
      );
    } finally {
      if (mounted) setState(() => _otaRunning = false);
    }
  }

  Future<void> _showClearDeviceOwnerDialog() async {
    _confirmController.clear();

    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Админ действия'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Снятие Device Owner отключит полноценный киоск для этого приложения. '
                'После этого устройство можно будет настроить заново или удалить приложение.\n\n'
                'Чтобы продолжить, введите слово CLEAR.',
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _confirmController,
                textCapitalization: TextCapitalization.characters,
                decoration: const InputDecoration(
                  hintText: 'Введите CLEAR',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: _clearingDo ? null : () => Navigator.of(ctx).pop(),
              child: const Text('Отмена'),
            ),
            FilledButton(
              onPressed: _clearingDo
                  ? null
                  : () async {
                      final v = _confirmController.text.trim().toUpperCase();
                      if (v != 'CLEAR') {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Введите CLEAR, чтобы подтвердить'),
                          ),
                        );
                        return;
                      }

                      setState(() => _clearingDo = true);
                      try {
                        await _dpc.invokeMethod('clearDeviceOwner');
                        if (!mounted) return;
                        Navigator.of(ctx).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Device Owner снят')),
                        );
                      } on PlatformException catch (e) {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Ошибка: ${e.message ?? e.code}'),
                          ),
                        );
                      } catch (e) {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Ошибка: $e')),
                        );
                      } finally {
                        if (mounted) setState(() => _clearingDo = false);
                      }
                    },
              child: const Text('Снять DO'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'QrPay Kiosk',
        hasLeading: false,
      ),
      body: BlocConsumer<KioskBloc, KioskState>(
        bloc: viewModel.kioskBloc,
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          failed: (error, _) {
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(
                textAlign: TextAlign.start,
                message: error,
              ),
              dismissType: DismissType.onSwipe,
            );
            return null;
          },
          success: (response) => viewModel.initData(response, true),
          checkKioskSuccess: (response) => viewModel.initData(response, false),
        ),
        builder: (context, state) {
          return ValueListenableBuilder<bool>(
            valueListenable: viewModel.hasInternet,
            builder: (context, hasInternet, _) {
              return Stack(
                children: [
                  Padding(
                    padding: AppPaddings.horizontal16,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // ✅ Логотип с hidden admin action
                        GestureDetector(
                          onLongPress:
                              _clearingDo ? null : _showClearDeviceOwnerDialog,
                          child: Image.asset(
                            AppWebpImages.logo,
                            height: 100,
                          ),
                        ),

                        const ColumnSpacer(3),

                        if (!hasInternet) ...[
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.primitiveNeutralcold100,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.primitiveNeutralcold200,
                              ),
                            ),
                            child: Text(
                              'Нет интернета. Подключите Wi-Fi, чтобы продолжить.\n'
                              'Проверка киоска выполнится автоматически, как только интернет появится.',
                              style: AppTextStyles.bodyM.copyWith(
                                fontSize: 13.sp,
                                color: AppColors.primitiveNeutralcold700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const ColumnSpacer(2),
                        ] else ...[
                          Text(
                            'Интернет подключен ✅',
                            style: AppTextStyles.bodyM.copyWith(
                              fontSize: 13.sp,
                              color: AppColors.semanticSuccessDefault,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const ColumnSpacer(2),
                        ],

                        CustomTextField(
                          placeholder: 'Код киоска',
                          fontSize: 14.sp,
                          controller: viewModel.kioskNameController,
                        ),
                        const ColumnSpacer(1),
                        Text(
                          'Чтобы получить код киоска, обратитесь к менеджеру QrPay',
                          style: AppTextStyles.bodyM.copyWith(
                            fontSize: 13.sp,
                            color: AppColors.primitiveNeutralcold500,
                          ),
                        ),

                        const ColumnSpacer(3),

                        // ✅ Регистрация: без интернета кнопка отключена
                        CustomButton(
                          text: 'Зарегистрировать',
                          fontSize: 16.sp,
                          onPressed: hasInternet
                              ? () async => viewModel.register()
                              : null,
                        ),

                        const ColumnSpacer(1.5),

                        // ✅ Wi-Fi: доступна всегда
                        CustomButton(
                          text: hasInternet
                              ? 'Wi-Fi (сменить)'
                              : 'Подключить Wi-Fi',
                          fontSize: 16.sp,
                          onPressed: _openWifi,
                        ),

                        const ColumnSpacer(1),

                        // ✅ OTA: только при наличии интернета
                        CustomButton(
                          text: _otaRunning
                              ? 'Обновление…'
                              : 'Обновить приложение',
                          fontSize: 16.sp,
                          onPressed: (!hasInternet || _otaRunning)
                              ? null
                              : _runOtaUpdate,
                        ),
                      ],
                    ),
                  ),

                  // loader как у тебя
                  state.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    loading: () => Container(
                      color: AppColors.primitiveNeutralwarm1000
                          .withValues(alpha: 0.7),
                      child: const CircleLoader(),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
