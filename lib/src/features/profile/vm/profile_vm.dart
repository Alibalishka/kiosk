import 'dart:developer';

import 'package:qr_pay_app/src/features/profile/logic/model/responses/configuration_response.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/formatters/date_formats.dart';
import 'package:qr_pay_app/src/core/logic/token_storage.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/subscription_bloc/subscription_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/user_bloc/user_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/requests/user_update_request.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/subscription_model.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/user_response.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';

class ProfileVm extends ViewModel {
  BuildContext context;

  ProfileVm({required this.context});

  UserResponsesModel? user;
  SubscriptionModel? subscription;
  ConfigurationResponse? configuration;
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController =
      MaskedTextController(mask: '00.00.0000');
  TextEditingController phoneController =
      MaskedTextController(mask: '+7 (000) 000 0000');
  // TextEditingController emailController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String version = 'Загрузка..';

  void initController() {
    emailController.addListener(() {
      final text = emailController.text;
      if (!text.contains('@')) {
        log('Некорректный email: $text');
      } else {
        log('Введён корректный email: $text');
      }
    });
  }

  bool isAuthorized = false;
  UserBloc userBloc = UserBloc(authRepository: sl<AuthRepository>());
  // NotificationBloc notificationBloc =
  //     NotificationBloc(authRepository: sl<AuthRepository>());
  SubscriptionBloc subscriptionBloc =
      SubscriptionBloc(authRepository: sl<AuthRepository>());
  bool isDisable = true;
  bool isCheckSubscription = false;
  int countUnreadNotif = 0;

  String? selectedGender;

  void syncGender(int? isMale) {
    selectedGender = isMale == null
        ? LocaleKeys.selectGender.tr()
        : (isMale == 1 ? LocaleKeys.themale.tr() : LocaleKeys.thefemale.tr());
    notifyListeners();
  }

  bool? get genderValue {
    if (selectedGender == LocaleKeys.themale.tr()) {
      return true;
    } else if (selectedGender == LocaleKeys.thefemale.tr()) {
      return false;
    }
    return null;
  }

  Future<void> checkAuthorized() async {
    await Future.delayed(const Duration(milliseconds: 100));
    isAuthorized =
        sl<ITokenStorage>().getToken()?.isEmpty ?? true ? false : true;
    isAuthorized && user == null ? fetchUser() : null;
    // await Future.delayed(const Duration(milliseconds: 100));
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    sl<ITokenStorage>().deleteToken();
    user = null;
    subscription = null;
    // fetchSubscribtion();
    checkAuthorized();
  }

  @override
  void init() {
    super.init();
    // loadVersionInfo();
    checkAuthorized();
  }

  Future<void> loadVersionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    // await Future.delayed(const Duration(milliseconds: 100));
    // notifyListeners();
  }

  Future<void> fetchUser() async => userBloc.add(const UserEvent.fetchUser());

  void fetchConfiguration() =>
      userBloc.add(const UserEvent.fetchConfiguration());

  Future<void> initCinfiguration(ConfigurationResponse configuration) async {
    this.configuration = configuration;
    await Future.delayed(const Duration(milliseconds: 100));
    notifyListeners();
  }

  // void fetchSubscribtion() =>
  //     subscriptionBloc.add(const SubscriptionEvent.fetchSubscription());

  void updateUser(BuildContext context, UserBloc bloc) {
    final dateFormat = DateFormat("dd.MM.yyyy");
    if (birthDateController.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          textAlign: TextAlign.start,
          message: 'Выберите дату рождения',
        ),
        dismissType: DismissType.onSwipe,
      );
      return;
    }
    final parsedDate = dateFormat.parse(birthDateController.text);

    _parseDate()
        ? parseEmail()
            ? bloc.add(UserEvent.updateUser(
                body: UserUpdateRequest(
                name: nameController.text,
                phone: phoneController.text,
                bornDate: parsedDate,
                email: emailController.text,
                isMale: genderValue,
              )))
            : showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.error(
                  textAlign: TextAlign.start,
                  message:
                      'Проверьте правильность поля адреса электронной почты.',
                ),
                dismissType: DismissType.onSwipe,
              )
        : showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
                textAlign: TextAlign.start,
                message: LocaleKeys.enterCorrectFormat.tr()),
            dismissType: DismissType.onSwipe,
          );
  }

  Future<void> clearSubscription() async {
    user?.data?.subscription = null;
    await Future.delayed(const Duration(milliseconds: 100));
    notifyListeners();
  }

  bool _parseDate() {
    String inputText = birthDateController.text.trim();
    RegExp regExp = RegExp(r"^\d{2}\.\d{2}\.\d{4}$");

    if (regExp.hasMatch(inputText)) {
      try {
        DateFormat("dd.MM.yyyy").parseStrict(inputText);
        return true;
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }

  bool parseEmail() {
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final match = regex.firstMatch(emailController.text);

    if (match != null) {
      return true;
    } else {
      return false;
    }
  }

  void deleteAccount() => userBloc.add(const UserEvent.deleteUser());

  Future<void> onChange() async {
    isDisable = false;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> syncUnread(int countUnreadNotif) async {
    this.countUnreadNotif = countUnreadNotif;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> syncUserData(UserResponsesModel user) async {
    this.user = user;
    // user.data?.subscription == null ? fetchSubscribtion() : subscription = null;
    // fetchSubscribtion();
    nameController.text = user.data?.name ?? '';
    phoneController.text = user.data?.phone ?? '';
    emailController.text = user.data?.email ?? '';
    birthDateController.text = user.data?.bornDate == null
        ? ''
        : dayMonthYearByDot.format(user.data!.bornDate!);
    syncGender(user.data?.isMale);
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> saveSubscription(SubscriptionModel subscription) async {
    this.subscription = subscription;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  // int calculateCheckoutPrice({
  //   required double total,
  //   required int bonus,
  // }) {
  //   if (bonus <= total / 2) {
  //     return (total - bonus).toInt().floor();
  //   } else if (bonus > total / 2) {
  //     return (total ~/ 2).floor();
  //   } else {
  //     return 0;
  //   }
  // }

  double calculateBonusDiscount(double orderAmount, double bonusBalance) {
    // Максимальная сумма бонусов
    double maxBonusAmount =
        orderAmount * ((user?.data?.maxBonusPercent ?? 50) / 100);

    // Вернуть минимальное значение из доступного баланса и максимально разрешённой суммы
    return bonusBalance < maxBonusAmount ? bonusBalance : maxBonusAmount;
  }

  double calculateResult(double orderAmount, double bonusBalance) {
    double num =
        orderAmount - calculateBonusDiscount(orderAmount, bonusBalance);
    return num <= 50 && num != 0 ? 50 : num;
  }

  String calculateBonus(int total) {
    return (((user?.data?.cashbackPercentage ?? 0) * total) / 100)
        .floor()
        .toString();
  }

  Future<void> gotDrink() async {
    user?.data?.subscription?.isOrder = true;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }
}
