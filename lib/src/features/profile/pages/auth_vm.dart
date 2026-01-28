import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/logic/fisrt_start_storage.dart';
import 'package:qr_pay_app/src/core/logic/token_storage.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/register_request.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class AuthVm extends ViewModel {
  final BuildContext context;

  AuthVm({required this.context});

  late AuthBloc authBloc;
  late FirstStartStorage localStorage = sl<FirstStartStorage>();

  MaskedTextController phoneController = MaskedTextController(
    mask: '+7 (000) 000 0000',
    text: '+7 (',
  );

  MaskedTextController pinCodeController =
      MaskedTextController(mask: '0 0 0 0');

  void login() => authBloc.add(AuthEvent.login(phoneController.text));

  void register() => authBloc.add(
        AuthEvent.pinCode(
          request: RegisterRequest(
              phone: phoneController.text,
              code: pinCodeController.text.replaceAll(' ', '')),
        ),
      );

  @override
  void init() {
    super.init();
    authBloc = AuthBloc(
      authRepository: sl<AuthRepository>(),
      localStorage: sl<ITokenStorage>(),
    );
    pinCodeController.clear();
  }

  @override
  void dispose() {
    authBloc.close();
    super.dispose();
  }
}
