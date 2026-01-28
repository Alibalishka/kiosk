import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/server/dio_settings.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/promotions_bloc/promotions_event.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/promotions_bloc/promotions_state.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/promotions_model.dart';

class PromotionsBloc extends Bloc<PromotionsEvent, PromotionState> {
  final PromotionsRepository promotionsRepository;
  PromotionsBloc({required this.promotionsRepository})
      : super(PromotionInitial()) {
    on<GetPromotions>(_getPromotionsData);
  }
  _getPromotionsData(GetPromotions event, Emitter<PromotionState> emit) async {
    emit(PromotionLoading());
    try {
      emit(PromotionSuccess(
        promotionsEntity: await promotionsRepository.getPromotionsData(),
      ));
    } catch (e) {
      emit(PromotionsFailed());
      log('erroe _getPromotionsData: $e');
    }
  }
}

class PromotionsRepository {
  Dio dio = DioSettings().dio;

  Future<Promotions> getPromotionsData() async {
    Response response = await dio.get('/promotions');
    return Promotions.fromJson(response.data);
  }
}
