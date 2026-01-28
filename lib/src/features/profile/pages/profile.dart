import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/profile/widgets/auth_profile.dart';
import 'package:qr_pay_app/src/features/profile/widgets/not_auth_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.viewModel});
  final ProfileVm viewModel;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with ViewModelMixin<ProfilePage, ProfileVm> {
  @override
  ProfileVm get viewModel => widget.viewModel;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppComponents.navmenuNavmenuelementBgColorDefault,
        // AppComponents.buttongroupButtonGrayBgColorDisabled,
        //  viewModel.isAuthorized
        //     ? AppComponents.buttongroupButtonGrayBgColorDisabled
        //     : Colors.transparent,
        appBar: CustomAppBar(text: LocaleKeys.profile.tr()),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        // floatingActionButton: (viewModel.user?.data?.email == 'kiosk@gmail.com')
        //     ? Container(
        //         height: 48,
        //         width: 48,
        //         padding: const EdgeInsets.all(12),
        //         decoration: const BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: AppColors.primitiveNeutralcold1000,
        //         ),
        //         child: SvgPicture.asset(
        //           AppSvgImages.iconKiosk,
        //           color: AppColors.primitiveNeutralcold0,
        //         ),
        //       )
        //     : null,
        body: viewModel.isAuthorized
            ? AuthorizedProfileWidget(viewModel: viewModel)
            : const NotAutorizedProfileWidget(),
      );
}
