import 'package:ecommerce/src/controllers/screen_controllers/splash_screen_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/screens/wrapper_screen.dart';
import 'package:ecommerce/src/views/widgets/custom_loading_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final SplashScreenController splashScreenController = Get.put(SplashScreenController());
    // Go to Home Screen
    splashScreenController.addListener(() {
      if (splashScreenController.isDone && splashScreenController.isInit) Get.off(() => MainScreenWrapper());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Logo
            Center(child: SvgPicture.asset('lib/assets/svg/logo.svg')),
            Positioned(
              left: 0,
              right: 0,
              bottom: defaultBoxHeight,
              child: Column(
                children: const [
                  // Loading status
                  CustomCircularProgressBar(),
                  SizedBox(height: defaultPadding),
                  // Version
                  Text("Version $appVersion", style: defaultSubtitle1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
