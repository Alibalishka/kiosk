import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/reserv_bloc/reserv_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/available_times_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/reserv_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/available_times_response.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/detail_item_model.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/detail_item_repository.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingVm extends ViewModel {
  final BuildContext context;
  final DetailItemModel item;
  final bool canReserve;

  BookingVm({
    required this.context,
    required this.item,
    required this.canReserve,
  });

  late ReservBloc reservBloc;
  List<dynamic> guestList = [1, 2, 3, 4, 5, 6, LocaleKeys.moreThanSix.tr()];
  DateTime nowDate = DateTime.now();
  DateTime lastDate = DateTime.now().add(const Duration(days: 31));
  DateTime focusedDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  AvailableTimesResponse availableTimes = AvailableTimesResponse();
  TextEditingController commentController = TextEditingController();
  DateTime? selectedTime;
  int tableId = 0;
  // SEND REQUEST DATA
  dynamic guestCount;

  @override
  void init() {
    super.init();
    reservBloc = ReservBloc(detailItemRepository: sl<DetailItemRepository>());
  }

  /// Select Count Guest
  Future<void> selectGuestCount(guestCount) async {
    this.guestCount = guestCount;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  /// Select Date
  Future<void> onDaySelect(DateTime selectDate, DateTime focusDate) async {
    if (!isSameDay(selectedDate, selectDate)) {
      selectedDate = selectDate;
      focusedDate = focusDate;
    }
  }

  Future<void> selectTime(int index) async {
    selectedTime = availableTimes.data?[index].startDatetime;
    if (canReserve) tableId = availableTimes.data?[index].tablesIds?[0] ?? 0;
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  void fetchTimes() => reservBloc.add(
        ReservEvent.fetchTimes(
          body: AvailableTimesRequest(
            itemId: item.data?.id ?? 0,
            date: DateFormat('dd.MM.yyyy').format(selectedDate),
            guestsCount: guestCount,
          ),
        ),
      );

  Future<void> initTimes(AvailableTimesResponse availableTimes) async {
    this.availableTimes = availableTimes;
    notifyListeners();
  }

  void reserv() {
    if (canReserve) {
      reservBloc.add(
        ReservEvent.reserv(
          body: ReservRequest(
            itemId: item.data?.id ?? 0,
            date: DateFormat('dd.MM.yyyy').format(selectedDate),
            guestsCount: guestCount,
            time: DateFormat('HH:mm').format(selectedTime!),
            tableId: tableId,
            duration: 12600,
            comment: commentController.text,
          ),
        ),
      );
    } else {
      String message = """
      📌 Бронирование столика

      🔹 Имя: ${context.read<ProfileVm>().user?.data?.name} ${context.read<ProfileVm>().user?.data?.lastName}
      🔹 Количество гостей: $guestCount человек
      🔹 Дата: ${DateFormat('dd.MM.yyyy').format(selectedDate)}
      🔹 Время: ${DateFormat('HH:mm').format(selectedTime!)}
      🔹 Комментарий: ${commentController.text}

      Буду ждать подтверждения! 😊🍽️
      """;
      String encodedMessage = Uri.encodeComponent(message);
      LaunchInBrowserUtil.launchUrl(
        'https://wa.me/77018512141?text=$encodedMessage',
        LaunchMode.externalApplication,
      );
    }
  }

  String formatPhoneNumber(String phone) {
    return phone.replaceAll(RegExp(r'\D'), '').replaceFirst(RegExp(r'^7'), '');
  }

  void openWpp() {
    String message = """
Бронирование столика

Аты/Имя: ${context.read<ProfileVm>().user?.data?.name ?? ''}
Адам саны/Кол-во персон: $guestCount гостей
Күні/Дата: ${DateFormat('dd.MM.yyyy').format(selectedDate)}
Уақыт/Время: ${DateFormat('HH:mm').format(selectedTime!)}
Түсініктеме/Комментарий: ${commentController.text}

Буду ждать подтверждения! 😊🍽️
""";
    String encodedMessage = Uri.encodeComponent(message);
    LaunchInBrowserUtil.launchUrl(
      'https://wa.me/${formatPhoneNumber(item.data?.phone ?? '')}?text=$encodedMessage',
      LaunchMode.externalApplication,
    );
  }
}
