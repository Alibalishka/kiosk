import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/subscription_model.dart';
import 'package:shimmer/shimmer.dart';

class ItemSubscriptionInfo extends StatelessWidget {
  const ItemSubscriptionInfo({
    super.key,
    required this.data,
  });

  final TermInfo? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.all,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppComponents.navmenuNavmenuelementBgColorDefault),
      child: Row(
        children: [
          CachedNetworkImage(
            height: 32,
            width: 32,
            progressIndicatorBuilder: (context, url, progress) =>
                Shimmer.fromColors(
              baseColor: AppComponents.shimmerBase,
              highlightColor: AppComponents.shimmerHighlight,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primitiveNeutral0,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            imageUrl: data?.bgImage ?? '',
            imageBuilder: (context, placeholder) => Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                  image: placeholder,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const RowSpacer(0.8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data?.name ?? 'null',
                  style: AppTextStyles.bodyLStrong.copyWith(
                      color:
                          AppComponents.navmenuNavmenuelementLabelColorDefault),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                const ColumnSpacer(0.4),
                Text(
                  data?.description ?? 'null',
                  style: AppTextStyles.bodyM.copyWith(
                      color: AppComponents
                          .navmenuNavmenuelementSubtitleColorDefault),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
