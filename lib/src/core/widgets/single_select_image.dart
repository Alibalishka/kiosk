import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class SingleSelectImage extends StatefulWidget {
  final String? avatarImage;
  final Function(XFile) onSelet;
  final String title;
  const SingleSelectImage({
    super.key,
    this.title = 'Фотографии *',
    this.avatarImage,
    required this.onSelet,
  });

  @override
  State<SingleSelectImage> createState() => _SingleSelectImageState();
}

class _SingleSelectImageState extends State<SingleSelectImage> {
  ImagePicker imagePicker = ImagePicker();
  XFile? imageFile;
  bool isNetworkImage = false;

  void selectImages(BuildContext context) async {
    final XFile? selectedImages =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImages?.path.isNotEmpty ?? false) {
      isNetworkImage = false;
      widget.onSelet(selectedImages!);
    }
    setState(() => imageFile = selectedImages);
  }

  @override
  void initState() {
    super.initState();
    widget.avatarImage?.isNotEmpty ?? false ? isNetworkImage = true : null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ColumnSpacer(0.8),
        isNetworkImage
            ? GestureDetector(
                onTap: () => selectImages(context),
                child: CachedNetworkImage(
                  height: 102,
                  width: 140,
                  imageUrl: widget.avatarImage ??
                      'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=1024x1024&w=is&k=20&c=5aen6wD1rsiMZSaVeJ9BWM4GGh5LE_9h97haNpUQN5I=',
                  imageBuilder: (context, placeholder) => Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      image: DecorationImage(
                        image: placeholder,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                //   CachedNetworkImage(
                //   imageUrl: image ??
                //       'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=1024x1024&w=is&k=20&c=5aen6wD1rsiMZSaVeJ9BWM4GGh5LE_9h97haNpUQN5I=',
                //   imageBuilder: (context, placeholder) {
                //     return Container(
                //       height: 100,
                //       width: 98,
                //       decoration: BoxDecoration(
                //         image: DecorationImage(
                //           image: placeholder,
                //         ),
                //       ),
                //     );
                //   },
                // ),
              )
            : imageFile?.path.isNotEmpty ?? false
                ? GestureDetector(
                    onTap: () => selectImages(context),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      child: Image.file(
                        File(imageFile!.path),
                        fit: BoxFit.cover,
                        height: 102,
                        width: 140,
                      ),
                    ),
                  )
                : SelectImagesButton(
                    hasStyleBox: false,
                    onTap: () => selectImages(context),
                  )
      ],
    );
  }
}

class SelectImagesButton extends StatelessWidget {
  final Function()? onTap;
  final bool hasStyleBox;
  const SelectImagesButton({
    super.key,
    required this.onTap,
    required this.hasStyleBox,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: hasStyleBox ? 16 : 0),
        child: Container(
          decoration: const BoxDecoration(
              color: AppColors.semanticBgSurface4,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 29.5, horizontal: 47),
            child: SvgPicture.asset(AppSvgImages.camera),
          ),
        ),
      ),
    );
  }
}
