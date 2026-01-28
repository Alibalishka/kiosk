// import 'package:qr_pay_app/src/core/resources/app_colors.dart';
// import 'package:qr_pay_app/src/core/resources/app_components.dart';
// import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
// import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class SelectMultipleImages extends StatefulWidget {
//   final String text;
//   final bool hasStyleBox;
//   final List<String>? imagePath;
//   final Function(List<XFile>?)? onChanged;
//   const SelectMultipleImages({
//     super.key,
//     this.text = 'Фотографии *',
//     this.hasStyleBox = true,
//     this.imagePath,
//     this.onChanged,
//   });

//   @override
//   State<SelectMultipleImages> createState() => _SelectMultipleImagesState();
// }

// class _SelectMultipleImagesState extends State<SelectMultipleImages> {
//   //late final createAdsViewModel = context.read<EditViewModel>();
//   ImagePicker imagePicker = ImagePicker();
//   List<XFile> imageFileList = [];
//   bool isRemoveStatus = false;

//   void selectImages() async {
//     final List<XFile> selectedImages = await imagePicker.pickMultiImage();

//     selectedImages.isNotEmpty
//         ? setState(() => imageFileList.addAll(selectedImages))
//         : null;
//     //createAdsViewModel.saveImages(imageFileList);
//     widget.onChanged?.call(imageFileList);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return Consumer<EditViewModel>(
//     //   builder: (context, value, state) {
//     return Container(
//       decoration: widget.hasStyleBox
//           ? const BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(12)),
//             )
//           : null,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             widget.text,
//             style: AppTextStyles.bodyM.copyWith(
//                 color: AppComponents.inputPrimaryLabeltextColorDefault),
//           ),
//           const ColumnSpacer(0.8),
//           // ReorderableGridView.count(
//           //   physics: const NeverScrollableScrollPhysics(),
//           //   shrinkWrap: true,
//           //   padding: AppPaddings.empty,
//           //   dragWidgetBuilder: (index, child) {
//           //     return ImageWidget(
//           //       image: imageFileList.first,
//           //       //value.images[index],
//           //       isRemoveStatus: isRemoveStatus,
//           //     );
//           //   },
//           //   dragStartBehavior: DragStartBehavior.start,
//           //   onReorder: (int oldIndex, int newIndex) {
//           //     // setState(() {
//           //     //   if (oldIndex < newIndex) {
//           //     //     newIndex -= 1;
//           //     //   }
//           //     //   XFile image = value.images.removeAt(oldIndex);
//           //     //   value.images.insert(newIndex, image);
//           //     // });
//           //   },
//           //   crossAxisCount: 3,
//           //   crossAxisSpacing: 8,
//           //   mainAxisSpacing: 8,
//           //   childAspectRatio: 1,
//           //   mainAxisExtent: 102,
//           //   header: [
//           //     OpenGalleryButton(
//           //       hasStyleBox: widget.hasStyleBox,
//           //       onTap: () => selectImages(),
//           //     )
//           //   ],
//           //   //children:
//           //   // List.generate(
//           //   //   value.images.length,
//           //   //   (index) => ImageWidget(
//           //   //     key: Key('$index'),
//           //   //     image: value.images[index],
//           //   //     isRemoveStatus: isRemoveStatus,
//           //   //     isRemove: () =>
//           //   //         setState(() => isRemoveStatus = !isRemoveStatus),
//           //   //     removeImage: () {
//           //   //       setState(() => value.images.removeAt(index));
//           //   //       //value.tempImageData.data!.removeAt(index);
//           //   //     },
//           //   //   ),
//           //   // ),
//           // ),
//           // const ColumnSpacer(0.8),
//           Text(
//             'Первое фото - обложка. Перетащите, чтобы изменить порядок',
//             style:
//                 AppTextStyles.bodyM.copyWith(color: AppColors.semanticFgSoft),
//           ),
//         ],
//       ),
//     );
//     //   },
//     // );
//   }
// }
