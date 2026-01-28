import 'package:meta/meta.dart';

@immutable
sealed class PromotionsEvent {}

class GetPromotions extends PromotionsEvent{}
