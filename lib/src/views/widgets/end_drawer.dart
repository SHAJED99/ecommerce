import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EndDrawer extends StatelessWidget {
  final DataController dataController = Get.find();
  EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
      color: Theme.of(context).canvasColor,
      margin: const EdgeInsets.only(left: defaultPadding * 4),
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: [
          Expanded(child: Container()),
          CustomElevatedButton(
            margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
            expanded: true,
            onTap: () {
              if (dataController.token.isNotEmpty) dataController.logout();
            },
            child: Obx(
              () => Text(
                dataController.token.isEmpty ? "Login" : "Logout",
                style: buttonText1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
