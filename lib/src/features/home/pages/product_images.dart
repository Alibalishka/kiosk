import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductImagesWidget extends StatefulWidget {
  const ProductImagesWidget({
    super.key,
  });

  @override
  State<ProductImagesWidget> createState() => _ProductImagesWidgetState();
}

class _ProductImagesWidgetState extends State<ProductImagesWidget> {
  List<String> imageList = [
    'https://content3.flowwow-images.com/data/blog/23/1684380842_94662323.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMaS1K5hl7nXlsJ106MifiYieh-VqwY8f1o1Gb9qqJQA&s',
    'https://ir.ozone.ru/s3/multimedia-q/c1000/6166498550.jpg',
    'https://m.dom-eda.com/uploads/images/catalog/item/86df51de21/c25c94fe96_1000.jpg',
  ];
  int selectedImageIndex = 0;
  List<bool> containerStates = [];

  @override
  void initState() {
    super.initState();
    // containerStates = List.generate(
    //     widget.imagesItem?.length ?? imageList.length, (index) => false);
    containerStates[0] = true;
  }

  void _handleVerticalDrag(DragUpdateDetails details) {
    if (details.primaryDelta! > 10) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: _handleVerticalDrag,
      child: Scaffold(
        backgroundColor: AppColors.primitiveNeutral25,
        body: Column(
          children: [
            Container(
              color: AppColors.semanticBgSurface1,
              padding:
                  const EdgeInsets.only(left: 16, right: 16, bottom: 6, top: 6),
              child: MediaQuery.removePadding(
                context: context,
                removeBottom: true,
                child: SafeArea(
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => context.router.pop(),
                          child: SvgPicture.asset(AppSvgImages.iconLeft),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const ColumnSpacer(9),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.45,
            //   child: CarouselSlider(
            //     carouselController: controller,
            //     options: CarouselOptions(
            //       height: double.infinity,
            //       viewportFraction: 2,
            //       onPageChanged: (index, reason) {
            //         setState(() {
            //           selectedImageIndex = index;
            //           for (int i = 0; i < containerStates.length; i++) {
            //             containerStates[i] = (i == index);
            //           }
            //         });
            //       },
            //     ),
            //     items:
            //         (widget.imagesItem != null && widget.imagesItem!.isNotEmpty
            //                 ? widget.imagesItem!
            //                 : imageList)
            //             .map((item) {
            //       final imageUrl = item is ImageItem ? item.path : item;
            //       return Builder(
            //         builder: (BuildContext context) {
            //           return Padding(
            //             padding: const EdgeInsets.all(16.0),
            //             child: PhotoView(
            //               imageProvider: NetworkImage(imageUrl.toString()),
            //               backgroundDecoration: const BoxDecoration(
            //                 color: Colors.transparent,
            //               ),
            //               minScale: PhotoViewComputedScale.contained,
            //               maxScale: PhotoViewComputedScale.covered * 2,
            //             ),
            //             // Image.network(
            //             //   imageUrl.toString(),
            //             //   fit: BoxFit.cover,
            //             // ),
            //           );
            //         },
            //       );
            //     }).toList(),
            //     // items: imageList.map((image) {
            //     //   return Builder(
            //     //     builder: (BuildContext context) {
            //     //       return Padding(
            //     //         padding: const EdgeInsets.all(16.0),
            //     //         child: Image.network(
            //     //           image,
            //     //           fit: BoxFit.cover,
            //     //         ),
            //     //       );
            //     //     },
            //     //   );
            //     // }).toList(),
            //   ),
            // ),
            // SizedBox(height: MediaQuery.of(context).size.height * 0.134),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.11,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 30),
            //     child: ListView.separated(
            //       physics: const NeverScrollableScrollPhysics(),
            //       scrollDirection: Axis.horizontal,
            //       separatorBuilder: (BuildContext context, int index) =>
            //           const RowSpacer(0.8),
            //       itemCount: widget.imagesItem?.length ?? imageList.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Column(
            //           children: [
            //             containerStates[index]
            //                 ? Container(
            //                     height: 4,
            //                     width: 80,
            //                     decoration: BoxDecoration(
            //                         color: AppColors.primitiveBrand500,
            //                         borderRadius: BorderRadius.circular(8)),
            //                   )
            //                 : const SizedBox(
            //                     height: 4,
            //                   ),
            //             const ColumnSpacer(0.4),
            //             GestureDetector(
            //               onTap: () {
            //                 setState(() {
            //                   selectedImageIndex = index;
            //                   for (int i = 0; i < containerStates.length; i++) {
            //                     containerStates[i] = (i == index);
            //                   }
            //                 });
            //                 controller.jumpToPage(index);
            //               },
            //               child: Image.network(
            //                 widget.imagesItem?[index].path ?? imageList[index],
            //                 width: 80,
            //                 height: 64,
            //               ),
            //             ),
            //           ],
            //         );
            //       },
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
