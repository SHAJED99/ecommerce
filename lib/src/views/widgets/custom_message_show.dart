import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMessageBarNoItemHere extends StatelessWidget {
  const CustomMessageBarNoItemHere({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Nothing to show here",
      style: defaultSubtitle1.copyWith(height: 1, color: defaultBlackColor),
    );
  }
}

class NeedLoginToAccess extends StatelessWidget {
  final DataController dataController = Get.find();
  NeedLoginToAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Stack(
        children: [
          Center(
              child: Text(
            "Please login to access your cart",
            style: defaultSubtitle1.copyWith(height: 1, color: defaultBlackColor),
          )),
          const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Align(
                child: CustomElevatedButton(
                  constraints: BoxConstraints(maxWidth: defaultMaxWidth),
                  expanded: true,
                  child: Text(
                    "Login",
                    style: buttonText1,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
