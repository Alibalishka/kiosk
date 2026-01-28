import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/features/home/vm/map_vm.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    super.key,
    required this.viewModel,
  });
  final MapVm viewModel;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with ViewModelMixin<MapPage, MapVm> {
  @override
  MapVm get viewModel => widget.viewModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.semanticBgPage,
        centerTitle: true,
        title: Text(LocaleKeys.location.tr(),
            style: AppTextStyles.headingH2.copyWith(
              color: AppComponents.navbarTitleColorDefault,
            )),
        leading: GestureDetector(
          onTap: () => context.router.pop(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SvgPicture.asset(AppSvgImages.arrowLeft),
          ),
        ),
      ),
      body: YandexMap(
        mapObjects: viewModel.mapObjects,
        mapType: MapType.vector,
        onMapCreated: (controller) =>
            viewModel.mapControllerCompleter.complete(controller),
      ),
    );
  }
}
