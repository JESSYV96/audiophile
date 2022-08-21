import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/theme/colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Modular.setNavigatorKey();
    Modular.setInitialRoute('/products/');

    return MaterialApp.router(
      title: 'Audiophile',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: AppColors.white,
            ),
            titleTextStyle: TextStyle(
              color: AppColors.white,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
            backgroundColor: AppColors.black),
        fontFamily: 'Manrope',
        textTheme: const TextTheme(
            headline1: TextStyle(
              color: AppColors.white,
              fontSize: 34,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
            headline2: TextStyle(
              color: AppColors.black,
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
            headline3: TextStyle(
              color: AppColors.black,
              fontSize: 26,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
            headline5: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
            headline6: TextStyle(
              color: AppColors.gray,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
            bodyText1: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            overline: TextStyle(
              color: AppColors.gray,
              fontSize: 16,
              letterSpacing: 10,
            ),
            subtitle1: TextStyle(
              color: AppColors.white,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            )),
        primarySwatch: AppColors.primaryBlack,
        scaffoldBackgroundColor: AppColors.white,
      ),
    );
  }
}
