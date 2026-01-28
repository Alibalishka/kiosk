import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/promotions_bloc/promotions_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/promotions_bloc/promotions_state.dart';
import 'package:qr_pay_app/src/features/home/widgets/brands.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/subscription_model.dart';
import 'package:qr_pay_app/src/features/profile/vm/subscription_vm.dart';
import 'package:shimmer/shimmer.dart';

class TermInfoSubscriptionWidget extends StatelessWidget {
  const TermInfoSubscriptionWidget(
      {super.key, required this.termInfo, this.index, required this.viewModel});
  final TermInfo? termInfo;
  final int? index;
  final SubscriptionVm viewModel;
  // late PromotionsBloc promotionBloc;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          height: 50,
          width: 50,
          imageUrl: termInfo?.bgImage ?? '',
          progressIndicatorBuilder: (context, url, progress) =>
              Shimmer.fromColors(
            baseColor: AppComponents.shimmerBase,
            highlightColor: AppComponents.shimmerHighlight,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primitiveNeutral0,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          fit: BoxFit.cover,
          imageBuilder: (context, placeholder) => Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                image: placeholder,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const RowSpacer(1.2),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                termInfo?.name ?? '',
                style: AppTextStyles.bodyLStrong.copyWith(
                    color:
                        AppComponents.navmenuNavmenuelementLabelColorDefault),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const ColumnSpacer(0.4),
              Text(
                termInfo?.description ?? '',
                style: AppTextStyles.bodyM
                    .copyWith(color: AppColors.semanticFgSoft),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const ColumnSpacer(3.2),
            ],
          ),
        ),
        //index == 1 ? const Spacer() : const SizedBox.shrink(),
        index == 1
            ? GestureDetector(
                onTap: () {
                  showCustomSheet(
                    context,
                    child: BlocBuilder<PromotionsBloc, PromotionState>(
                      bloc: viewModel.promotionBloc,
                      builder: (context, state) {
                        if (state is PromotionSuccess &&
                            (state.promotionsEntity.data?.length ?? 0) > 1) {
                          final promotion = state.promotionsEntity.data?[1];
                          return PromotionsSheet(
                            name: promotion?.name,
                            description: promotion?.description,
                            minDescription: promotion?.minDescription,
                            minImages: AppWebpImages.delete3,
                            close: true,
                          );
                        } else if (state is PromotionsFailed) {
                          return const Center(
                            child: Text('Ошибка загрузки акций'),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  );
                },
                child: SvgPicture.asset(
                  AppSvgImages.informationCircle,
                  color: AppColors.semanticFgSofter,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
