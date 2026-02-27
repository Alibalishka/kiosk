import 'package:cached_network_image/cached_network_image.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ItemCheckout extends StatelessWidget {
  const ItemCheckout({
    super.key,
    required this.item,
    this.removeTap,
    this.addTap,
  });

  final Items item;
  final Function()? removeTap;
  final Function()? addTap;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<QrMenuVm>(context);
    // final isTablet = viewModel.isTablet;
    final bool isTablet = true;
    return Padding(
      padding: AppPaddings.horizontal16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(isTablet),
          const RowSpacer(1.6),
          Expanded(child: _buildInfo(viewModel, isTablet)),
        ],
      ),
    );
  }

  Widget _buildImage(bool isTablet) {
    final height = isTablet ? 180.0 : 80.0;
    final width = isTablet ? 180.0 : 80.0;

    if (item.image?.isNotEmpty ?? false) {
      return CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: item.image?.first.path ?? '',
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            // color: AppColors.primitiveBlue600,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        AppWebpImages.notFoundImage,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildInfo(QrMenuVm viewModel, bool isTablet) {
    if (isTablet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.name ?? '',
            style: AppTextStyles.headingH4.copyWith(
              // fontSize: viewModel.isTablet ? 16.sp : null,
              fontSize: 16.sp,
              color: AppComponents.listitemBodytextColorDefault,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const ColumnSpacer(0.4),
          Text(
            item.description ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodyM.copyWith(
              // fontSize: viewModel.isTablet ? 14.sp : null,
              fontSize: 14.sp,
              color: AppColors.semanticFgSoft,
            ),
          ),
          const ColumnSpacer(0.4),
          Text(
            viewModel.getModifiers(item.modifiers ?? []),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodyL.copyWith(
              fontSize: 12.sp,
              color: AppComponents
                  .productcardorderContentTextcontentProductsubtitleColorDefault,
            ),
          ),
          Row(
            children: [
              Text(
                '${priceFormat(viewModel.getItemTotalPrice(item).toString())} ₸',
                style: AppTextStyles.bodyL.copyWith(
                  // fontSize: viewModel.isTablet ? 16.sp : null,
                  fontSize: 16.sp,
                  color: AppComponents
                      .productcardorderContentTextcontentProducttitleColorDefault,
                ),
              ),
              const Spacer(),
              _buildQuantityButton(isTablet),
            ],
          ),
        ],
      );
    }

    // 🟪 Для мобильных
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name ?? '',
          style: AppTextStyles.headingH4.copyWith(
            color: AppComponents.listitemBodytextColorDefault,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const ColumnSpacer(0.4),
        Text(
          '${priceFormat(viewModel.getItemTotalPrice(item).toString())} ₸',
          style: AppTextStyles.bodyL.copyWith(
            color: AppComponents
                .productcardorderContentTextcontentProducttitleColorDefault,
          ),
        ),
        Text(
          viewModel.getModifiers(item.modifiers ?? []),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyL.copyWith(
            color: AppComponents
                .productcardorderContentTextcontentProductsubtitleColorDefault,
          ),
        ),
        const ColumnSpacer(1.2),
        _buildQuantityButton(isTablet),
      ],
    );
  }

  Widget _buildQuantityButton(bool isTablet) {
    return Container(
      width: isTablet ? 160 : 115,
      height: isTablet ? 46 : 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppComponents.buttongroupButtonGrayBgColorDefault,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: removeTap,
              child: Padding(
                padding: AppPaddings.vertical12,
                child: SvgPicture.asset(
                  AppSvgImages.minus,
                  height: isTablet ? 24 : null,
                  color: AppComponents.buttongroupButtonGrayIconColorDefault,
                ),
              ),
            ),
          ),
          Text(
            item.count.toString(),
            style: AppTextStyles.bodyLStrong.copyWith(
              fontSize: isTablet ? 14.sp : null,
              color: AppComponents.buttongroupButtonGrayIconColorDefault,
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: addTap,
              child: Padding(
                padding: AppPaddings.vertical12,
                child: SvgPicture.asset(
                  AppSvgImages.plus,
                  height: isTablet ? 18 : null,
                  color: AppComponents.buttongroupButtonGrayIconColorDefault,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
