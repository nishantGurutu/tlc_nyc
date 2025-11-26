part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const DASHBOARDSCREEN = _Paths.DASHBOARDSCREEN;
  static const LOGIN = _Paths.LOGIN;
  static const BOTTOMBAR = _Paths.BOTTOMBAR;
}

abstract class _Paths {
  _Paths._();
  static const DASHBOARDSCREEN = '/dash_board_screen';
  static const LOGIN = '/login';
  static const BOTTOMBAR = '/bottom_navigation_bar_screen';
}
