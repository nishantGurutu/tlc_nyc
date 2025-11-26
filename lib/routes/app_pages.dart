import 'package:get/get.dart';
import 'package:tlc_nyc/bindings/dashboard_binding.dart';
import 'package:tlc_nyc/bindings/login_binding.dart';
import 'package:tlc_nyc/view/screens/authenticated/dash_board_screen.dart';
import 'package:tlc_nyc/view/screens/unauthentication/login_screen.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.DASHBOARDSCREEN,
      page: () => DashBoardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}
