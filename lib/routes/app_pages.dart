import 'package:get/get.dart';
import 'package:tlc_nyc/bindings/bottombar_binding.dart';
import 'package:tlc_nyc/bindings/dashboard_binding.dart';
import 'package:tlc_nyc/bindings/login_binding.dart';
import 'package:tlc_nyc/bindings/splash_binding.dart';
import 'package:tlc_nyc/bindings/test_intro_binding.dart';
import 'package:tlc_nyc/bindings/test_screen_binding.dart';
import 'package:tlc_nyc/view/screens/authenticated/bottom_navigation_bar_screen.dart';
import 'package:tlc_nyc/view/screens/authenticated/dash_board_screen.dart';
import 'package:tlc_nyc/view/screens/authenticated/test_intro.dart';
import 'package:tlc_nyc/view/screens/authenticated/test_screen.dart';
import 'package:tlc_nyc/view/screens/unauthentication/login_screen.dart';
import 'package:tlc_nyc/view/screens/unauthentication/register_screen.dart';
import 'package:tlc_nyc/view/screens/unauthentication/splash_screen.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.DASHBOARDSCREEN,
      page: () => DashBoardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => RegisterScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMBAR,
      page: () => BottomNavigationBarScreen(),
      binding: BottombarBinding(),
    ),
    GetPage(
      name: _Paths.TESTINTRO,
      page: () => TestIntroScreen(typeId: '', typeName: ''),
      binding: TestIntroBinding(),
    ),
    GetPage(
      name: _Paths.TEST,
      page: () => TestScreen(),
      binding: TestScreenBinding(),
    ),
  ];
}
