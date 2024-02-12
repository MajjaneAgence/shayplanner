import 'package:shayplanner/components/forgot_password/forgot_password_screen.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/register/register_screen.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/shops/shops_screen.dart';

var router = [
  GetPage(
    name: LoginScreen.routename,
    page: () => LoginScreen(),
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
];
