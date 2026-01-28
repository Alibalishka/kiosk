import 'dart:async';

// import 'package:ota_update/ota_update.dart';
import 'package:package_info_plus/package_info_plus.dart';
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

  // OtaEvent? _otaEvent;
  // StreamSubscription<OtaEvent>? _otaSub;
  bool _otaRunning = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.initDeviceInfo();
      await viewModel.checkKiosk();
    });
  }

  @override
  void dispose() {
    // _otaSub?.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'QrPay Kiosk',
        hasLeading: true,
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
          return Stack(
            children: [
              Padding(
                padding: AppPaddings.horizontal16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      AppWebpImages.logo,
                      height: 100,
                    ),
                    const ColumnSpacer(7),
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
                    CustomButton(
                      text: 'Зарегистрировать',
                      fontSize: 16.sp,
                      onPressed: () async => viewModel.register(),
                    ),
                    const ColumnSpacer(1.5),

                    // ✅ OTA кнопка
                    // CustomButton(
                    //   text: _otaLabel(),
                    //   fontSize: 16.sp,
                    //   onPressed: _otaRunning ? null : _startOta,
                    // ),

                    // ✅ текст прогресса (опционально)
                    // if (_otaEvent != null) ...[
                    //   const ColumnSpacer(1),
                    //   Text(
                    //     'Статус: ${_otaEvent!.status}  ${_otaEvent!.value ?? ''}',
                    //     style: AppTextStyles.bodyM.copyWith(
                    //       fontSize: 12.sp,
                    //       color: AppColors.primitiveNeutralcold500,
                    //     ),
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ],
                  ],
                ),
              ),
              state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                loading: () => Container(
                  color:
                      AppColors.primitiveNeutralwarm1000.withValues(alpha: 0.7),
                  child: const CircleLoader(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// class KioskRegister extends StatefulWidget {
//   const KioskRegister({
//     super.key,
//     required this.viewModel,
//   });
//   final KioskVm viewModel;

//   @override
//   State<KioskRegister> createState() => _KioskRegisterState();
// }

// class _KioskRegisterState extends State<KioskRegister>
//     with ViewModelMixin<KioskRegister, KioskVm> {
//   @override
//   KioskVm get viewModel => widget.viewModel;

//   @override
//   void initState() {
//     super.initState();

//     // Ждём, пока построится UI и BlocConsumer подпишется на bloc
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       // Ждём инициализацию девайса, если нужно
//       await viewModel.initDeviceInfo();
//       // Теперь безопасно дергать checkKiosk – listener уже подписан
//       await viewModel.checkKiosk();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(
//         text: 'QrPay Kiosk',
//         hasLeading: true,
//       ),
//       body: BlocConsumer<KioskBloc, KioskState>(
//         bloc: viewModel.kioskBloc,
//         listener: (context, state) => state.maybeWhen(
//           orElse: () => null,
//           failed: (error, _) {
//             showTopSnackBar(
//               Overlay.of(context),
//               CustomSnackBar.error(
//                 textAlign: TextAlign.start,
//                 message: error,
//               ),
//               dismissType: DismissType.onSwipe,
//             );
//             return null;
//           },
//           success: (response) => viewModel.initData(response),
//           checkKioskSuccess: (response) => viewModel.initData(response),
//         ),
//         builder: (context, state) {
//           return Stack(
//             children: [
//               Padding(
//                 padding: AppPaddings.horizontal16,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Image.asset(
//                       AppWebpImages.logo,
//                       height: 100,
//                     ),
//                     const ColumnSpacer(7),
//                     CustomTextField(
//                       placeholder: 'Код киоска',
//                       fontSize: 14.sp,
//                       controller: viewModel.kioskNameController,
//                     ),
//                     const ColumnSpacer(1),
//                     Text(
//                       'Чтобы получить код киоска, обратитесь к менеджеру QrPay',
//                       style: AppTextStyles.bodyM.copyWith(
//                         fontSize: 13.sp,
//                         color: AppColors.primitiveNeutralcold500,
//                       ),
//                     ),
//                     const ColumnSpacer(3),
//                     CustomButton(
//                       text: 'Зарегистрировать',
//                       fontSize: 16.sp,
//                       onPressed: () async => viewModel.register(),
//                     ),

//                     CustomButton(
//                       text: 'Обновить приложение',
//                       fontSize: 16.sp,
//                       onPressed: () async {
//                           try {
//                           const url = 'https://sandyq.dev.qrpay.kz/ota.apk';

//                           // важно для Android FileProvider
//                           final pkg = await PackageInfo.fromPlatform();
//                           final authority =
//                               '${pkg.packageName}.ota_update_provider';

//                           OtaUpdate()
//                               .execute(
//                             url,
//                             destinationFilename: 'ota.apk',
//                             androidProviderAuthority: authority,
//                             usePackageInstaller:
//                                 true, // можно false, если не нужен PackageInstaller
//                             // sha256checksum: 'ТУТ_SHA256', // опционально
//                           )
//                               .listen(
//                             (event) {
//                               setState(() => currentEvent = event);
//                             },
//                             onError: (e) {
//                               debugPrint('OTA stream error: $e');
//                             },
//                           );
//                         } catch (e) {
//                           debugPrint('Failed to make OTA update. Details: $e');
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               state.maybeWhen(
//                 orElse: () => const SizedBox.shrink(),
//                 loading: () => Container(
//                   color:
//                       AppColors.primitiveNeutralwarm1000.withValues(alpha: 0.7),
//                   child: const CircleLoader(),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
