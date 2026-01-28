import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/news_model.dart';
import 'package:qr_pay_app/src/features/home/vm/story_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/news.dart';

class StoryProvider extends StatelessWidget {
  const StoryProvider({
    super.key,
    required this.newsModel,
  });
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<StoryVm>(
        create: (_) => StoryVm(
          context: context,
          storyData: newsModel.data ?? [],
        ),
        child: Consumer<StoryVm>(
          builder: (context, value, child) => NewsWidget(viewModel: value),
        ),
      );
}
