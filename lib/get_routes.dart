import 'package:get/get.dart';
import 'package:memodia/auth/views/login.dart';
import 'package:memodia/auth/views/register.dart';
import 'package:memodia/memodia/views/group_list.view.dart';
import 'package:memodia/splashscreen.dart';
class AppRoutes {
  static final routes = [
    GetPage(
      name: '/splashscreen',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/',
      page: () => GroupList(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
    ),
    GetPage(
      name: '/register',
      page: () => RegisterPage(),
    ),
  ];
}
