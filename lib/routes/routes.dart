import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shayplanner/components/forgot_password/forgot_password_screen.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/introduction/introduction_screen.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/register/register_screen.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/shops/shops_screen.dart';

var router = [
  GetPage(
    name: LoginScreenForEmailAndSocial.routename,
    page: () => LoginScreenForEmailAndSocial(),
  ),
    GetPage(
    name: LoginScreenForPassword.routename,
    page: () => LoginScreenForPassword(),
  ),
  GetPage(
    name: RegisterScreen.routename,
    page: () => RegisterScreen(),
  ),
  GetPage(
    name: ForgotPasswordScreen.routename,
    page: () => ForgotPasswordScreen(),
  ),
  GetPage(
    name: HomeScreen.routename,
    page: () => HomeScreen(),
  ),
   GetPage(
    name: ShopsScreen.routename,
    page: () => ShopsScreen(),
  ),
  GetPage(
    name: IntroductionScreen.routename,
    page: () => IntroductionScreen(),
  ),
];
