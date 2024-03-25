import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shayplanner/components/about/about_screen.dart';
import 'package:shayplanner/components/booking_history/booking_history_screen.dart';
import 'package:shayplanner/components/favoris/favoris_screen.dart';
import 'package:shayplanner/components/forgot_password/forgot_password_screen.dart';
import 'package:shayplanner/components/forgot_password/set_new_password_screen.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/home/home_search/home_search_screen.dart';
import 'package:shayplanner/components/introduction/introduction_screen.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/notifications/notifications_screen.dart';
import 'package:shayplanner/components/profile/profile_editing_screens/change_password_screen.dart';
import 'package:shayplanner/components/profile/profile_editing_screens/personal_infos_screen.dart';
import 'package:shayplanner/components/profile/profile_screen.dart';
import 'package:shayplanner/components/register/register_screen.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_screen.dart';
import 'package:shayplanner/components/shops/salons_screen.dart';
import 'package:shayplanner/components/rating_app/rating_app_screen.dart';
import 'package:shayplanner/components/rating_salon/rating_salon_screen.dart';

var router = [
  GetPage(
    name: LoginScreenForEmailAndSocial.routename,
    page: () => LoginScreenForEmailAndSocial(),
  ),
  GetPage(
      name: LoginScreenForPassword.routename,
      page: () => LoginScreenForPassword(),
      transition: Transition.rightToLeft),
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
      transition: Transition.noTransition),
  GetPage(
      name: SalonsScreen.routename,
      page: () => SalonsScreen(),
      transition: Transition.noTransition),
  GetPage(
      name: IntroductionScreen.routename,
      page: () => const IntroductionScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(seconds: 1)),
  GetPage(
    name: SetNewPasswordScreen.routename,
    page: () => SetNewPasswordScreen(),
  ),
  GetPage(
    name: RatingAppScreen.routename,
    page: () => RatingAppScreen(),
  ),
  GetPage(
    name: RatingSalonScreen.routename,
    page: () => RatingSalonScreen(),
  ),
  GetPage(
    name: SalonSheetScreen.routename,
    page: () => SalonSheetScreen(),
  ),
  GetPage(
      name: ProfileScreen.routename,
      page: () => ProfileScreen(),
      transition: Transition.noTransition),
  GetPage(
    name: PersonalInfosScreen.routename,
    page: () => PersonalInfosScreen(),
  ),
  GetPage(
    name: ChangePasswordScreen.routename,
    page: () => ChangePasswordScreen(),
  ),
  GetPage(
      name: NotificationsScreen.routename,
      page: () => NotificationsScreen(),
      transition: Transition.upToDown),
  GetPage(
      name: AboutScreen.routename,
      page: () => AboutScreen(),
      transition: Transition.cupertinoDialog),
        GetPage(
      name: HomeSearchScreen.routename,
      page: () => HomeSearchScreen(),
      transition: Transition.downToUp),
           GetPage(
      name: BookingHistoryScreen.routename,
      page: () => BookingHistoryScreen(),
      transition: Transition.native),
  GetPage(
      name: FavorisScreen.routename,
      page: () => FavorisScreen(),
      transition: Transition.native),
];
