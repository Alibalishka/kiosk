import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/support_bloc/support_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';

class SupportVm extends ViewModel {
  final BuildContext context;

  SupportVm({required this.context});

  late SupportBloc supportBloc;
  final TextEditingController controller = TextEditingController();
  List<XFile> supportFiles = [];

  @override
  void init() {
    super.init();
    supportBloc = SupportBloc(authRepository: sl<AuthRepository>());
  }

  Future<void> choiceImages(BuildContext context) async {
    ImagePicker imagePicker = ImagePicker();
    List<XFile> selectImages = await imagePicker.pickMultiImage();
    selectImages.isNotEmpty ? supportFiles.addAll(selectImages) : null;
    await Future.delayed(const Duration(milliseconds: 0));
    notifyListeners();
  }

  Future<void> choiceFiles(BuildContext context) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    result != null
        ? supportFiles.addAll(result.paths.map((path) => XFile(path!)).toList())
        : null;
    await Future.delayed(const Duration(milliseconds: 0));
    notifyListeners();
  }

  Future<void> removeSupport(index) async {
    supportFiles.removeAt(index);
    await Future.delayed(const Duration(milliseconds: 0));
    notifyListeners();
  }

  Future<void> sendSupport() async {
    FormData formData = FormData.fromMap({'text': controller.text});
    if (supportFiles.isNotEmpty) {
      for (int i = 0; i < supportFiles.length; i++) {
        formData.files.add(MapEntry(
            'files[$i]',
            await MultipartFile.fromFile(supportFiles[i].path,
                filename: supportFiles[i].path.split('/').last)));
      }
    }
    supportBloc.add(SupportEvent.sendSupport(body: formData));
  }

  Future<void> onChangeTextEdit() async {
    controller;
    await Future.delayed(const Duration(milliseconds: 0));
    notifyListeners();
  }
}
