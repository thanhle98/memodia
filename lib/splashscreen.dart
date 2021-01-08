import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memodia/auth/auth.controller.dart';

class SplashScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffFFE5C4),
        child: Center(
          child: Image(image: AssetImage("assets/images/memodia.png")),
        ),
      ),
    );
  }
}
