import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/controllers/screen_controllers/wrapped_screen_controllers/cart_screen_controller.dart';
import 'package:ecommerce/src/controllers/screen_controllers/wrapped_screen_controllers/categories_screen_controller.dart';
import 'package:ecommerce/src/controllers/screen_controllers/wrapped_screen_controllers/home_screen_controller.dart';
import 'package:ecommerce/src/controllers/screen_controllers/wrapper_screen_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/screens/splash_screen.dart';
import 'package:ecommerce/src/views/screens/user_screens/login_screen.dart';
import 'package:ecommerce/src/views/screens/user_screens/otp_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: defaultPrimarySwatch,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: defaultPrimarySwatch).copyWith(
          error: defaultErrorColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: InitializedBinding(),
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
      }),
      home: const SplashScreen(),
      // home: LoginScreen(),
      // home: const OTPScreen(email: "kajiraj.raj@gmail.com"),
    );
  }
}

class InitializedBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DataController());
    Get.put(HomeScreenController());
    Get.put(CategoriesScreenController());
    Get.put(CartScreenController());
  }
}
