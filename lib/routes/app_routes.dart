part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const DASHBOARDSCREEN = _Paths.DASHBOARDSCREEN;
  static const LOGIN = _Paths.LOGIN;
}

abstract class _Paths {
  _Paths._();
  static const DASHBOARDSCREEN = '/dash_board_screen';
  static const LOGIN = '/login';
}
