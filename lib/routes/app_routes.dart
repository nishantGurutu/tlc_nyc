part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const DASHBOARDSCREEN = _Paths.DASHBOARDSCREEN;
  static const LOGIN = _Paths.LOGIN;
  static const SPLASH = _Paths.SPLASH;
  static const SIGNUP = _Paths.SIGNUP;
  static const BOTTOMBAR = _Paths.BOTTOMBAR;
  static const TESTINTRO = _Paths.TESTINTRO;
  static const TEST = _Paths.TEST;
}

abstract class _Paths {
  _Paths._();
  static const DASHBOARDSCREEN = '/dash_board_screen';
  static const SPLASH = '/splash_screen';
  static const LOGIN = '/login';
  static const SIGNUP = '/register_screen';
  static const BOTTOMBAR = '/bottom_navigation_bar_screen';
  static const TESTINTRO = '/test_intro';
  static const TEST = '/test_screen';
}
