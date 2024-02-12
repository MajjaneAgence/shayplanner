import 'package:shayplanner/components/splash/splash_screen.dart';
import 'package:shayplanner/routes/routes.dart';
import 'package:shayplanner/tools/translations/translate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// elmenent to add the themeAppBar
//palette color
//adjusting theme text
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: SplashScreen(),
        getPages: router,
        translationsKeys: AppTranslation.translationsKeys,
        locale: const Locale('fr', 'FR'));
  }
}
