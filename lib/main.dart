import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shayplanner/components/splash/splash_screen.dart';
import 'package:shayplanner/routes/routes.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/tools/translations/translate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedLanguage = prefs.getString('language');
  Locale locale = savedLanguage != null ? Locale(savedLanguage) : Locale('fr', 'FR');
  runApp(MyApp(locale: locale));
}

class MyApp extends StatelessWidget {
  final Locale locale;

  const MyApp({Key? key, required this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Montserrat-regular',
        primaryColor: yellow,
      ),
      getPages: router,
      translationsKeys: AppTranslation.translationsKeys,
      locale: locale,
      fallbackLocale: Locale('fr', 'FR'),
    );
  }

  //missing svg icons trash for deleting notifications
}
