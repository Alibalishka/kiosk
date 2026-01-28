import 'package:meta/meta.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/promotions_model.dart';

@immutable
sealed class PromotionState {}

final class PromotionInitial extends PromotionState {}

final class PromotionLoading extends PromotionState {}

final class PromotionSuccess extends PromotionState {
  final Promotions promotionsEntity;

  PromotionSuccess({
    required this.promotionsEntity,
  });
}

final class PromotionsFailed extends PromotionState {}
