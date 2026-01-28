// import 'package:qr_pay_app/src/features/home/widgets/products_gridview.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final String searchText;
  const ResultPage({super.key, required this.searchText});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  int current = 0;

  @override
  void initState() {
    // _filterBloc = FilterBloc(searchRepository: sl())
    //   ..add(FilterEvent.started(keyword: widget.searchText));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(),
      // Scaffold(
      //   body:
      //   BlocProvider<FilterBloc>.value(
      //     value: _filterBloc,
      //     child: BlocBuilder<FilterBloc, FilterState>(
      //       builder: (context, state) => state.when(
      //         initial: () => const ShimmerFilter(),
      //         success: (filterItem) => Column(
      //           children: [
      //             ResultAppBar(
      //               searchText: widget.searchText,
      //             ),
      //             // filterItem.data?.length == 0
      //             //     ?
      //             //     const Expanded(
      //             //         child: SingleChildScrollView(
      //             //           physics: AlwaysScrollableScrollPhysics(
      //             //               parent: BouncingScrollPhysics()),
      //             //           child: Column(
      //             //             children: [
      //             //               ColumnSpacer(15),
      //             //               NotAutorizedView(
      //             //                 title: 'Ничего не найдено',
      //             //                 subtitle:
      //             //                     'Товар не найден. Попробуйте составить другой запрос',
      //             //                 image: AppImages.emptyBox,
      //             //                 button: false,
      //             //                 buttonText: '',
      //             //               ),
      //             //             ],
      //             //           ),
      //             //         ),
      //             //       )
      //             //     : Expanded(
      //             //         child: SingleChildScrollView(
      //             //           physics: const AlwaysScrollableScrollPhysics(
      //             //               parent: BouncingScrollPhysics()),
      //             //           child: Column(
      //             //             children: [
      //             //               const ColumnSpacer(1.6),
      //             //               // ProductsGridView(
      //             //               //   item: filterItem.data,
      //             //               // ),
      //             //             ],
      //             //           ),
      //             //         ),
      //             //       ),
      //           ],
      //         ),
      //         error: (errorText) => Center(child: Text(errorText)),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
