import 'package:get/get.dart';
import 'package:memodia/auth/views/login.dart';
import 'package:memodia/auth/views/register.dart';
import 'package:memodia/product/views/product_details.view.dart';
import 'package:memodia/snap_sell.dart';
import 'package:memodia/splashscreen.dart';
import 'package:memodia/todo/views/views.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/splashscreen',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/',
      page: () => SnapSell(), //(uncomment here to swith to todo app)TodoList(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
    ),
    GetPage(
      name: '/register',
      page: () => RegisterPage(),
    ),
    GetPage(
      name: '/todos',
      page: () => TodoList(),
    ),
    GetPage(
      name: '/todos/:id/edit',
      page: () => EditTodo(),
    ),
    GetPage(
      name: '/add-todo',
      page: () => AddTodo(),
    ),
    GetPage(
      name: "/products/:product_id/view",
      page: () => ProductDetailsPage(),
    )
  ];
}
