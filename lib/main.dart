import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memodia/auth/auth.controller.dart';
import 'package:memodia/get_routes.dart';
import 'package:memodia/memodia/memodia.controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController authController =
      Get.put<AuthController>(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memodia',
      defaultTransition: Transition.fadeIn,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
      ),
      initialRoute: "/splashscreen",
      getPages: AppRoutes.routes,
    );
  }
}
