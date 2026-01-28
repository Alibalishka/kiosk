import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/language_bloc/language_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/language.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseLanguagePage extends StatefulWidget {
  const ChooseLanguagePage({super.key});

  @override
  State<ChooseLanguagePage> createState() => _ChooseLanguagePageState();
}

class _ChooseLanguagePageState extends State<ChooseLanguagePage> {
  List<Language> languages = [
    const Language(
      languageCode: AppLanguages.kk,
    ),
    const Language(
      languageCode: AppLanguages.ru,
    ),
    const Language(
      languageCode: AppLanguages.en,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.language.tr(),
        hasLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ColumnSpacer(1.6),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.semanticBgSurface1,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              padding: AppPaddings.empty,
              itemBuilder: (BuildContext context, int index) =>
                  _LanguageItemWidget(language: languages[index]),
              separatorBuilder: (BuildContext context, int index) =>
                  const CustomDivider(horizontalPadding: 16),
              itemCount: languages.length,
            ),
          ),
          const ColumnSpacer(1.6),
        ],
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 38),
      //   child: CustomButton(
      //     text: LocaleKeys.save.tr(),
      //     onPressed: () => context.router.pop(),
      //   ),
      // ),
    );
  }
}

class _LanguageItemWidget extends StatelessWidget {
  const _LanguageItemWidget({
    super.key,
    required this.language,
  });

  final Language language;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => BlocProvider.of<LanguageBloc>(context).add(
        LanguageEvent.languageChangeTapped(language.languageCode),
      ),
      child: Padding(
        padding: AppPaddings.symmetric16x14,
        child: Row(
          children: [
            SvgPicture.asset(
              Language.icons[language.languageCode] ?? '',
              width: 32,
            ),
            const RowSpacer(1.2),
            Text(
              Language.names[language.languageCode] ?? 'Не определено',
              style: AppTextStyles.headingH4
                  .copyWith(color: AppComponents.listitemTitleColorDefault),
            ),
            const Spacer(),
            context.locale.languageCode.contains(language.languageCode)
                ? SvgPicture.asset(AppSvgImages.radiobuttonOn)
                : SvgPicture.asset(AppSvgImages.radiobuttonOff),
          ],
        ),
      ),
    );
  }
}

Locale getLocale(String locale) {
  if (locale.contains(AppLanguages.kk)) {
    return const Locale('kk', 'KK');
  } else if (locale.contains(AppLanguages.ru)) {
    return const Locale('ru', 'RU');
  } else {
    return const Locale('en', 'US');
  }
}
