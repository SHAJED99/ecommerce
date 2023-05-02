import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetails extends StatelessWidget {
  UserDetails({super.key});
  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSize(
        duration: const Duration(milliseconds: defaultDuration),
        child: dataController.user.value.id == null
            ? const SizedBox()
            : CustomElevatedButton(
                enable: false,
                horizontalAlignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                boxShadow: defaultBoxShadowDown,
                backgroundColor: Theme.of(context).canvasColor,
                height: null,
                expanded: true,
                contentPadding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserDetailsText(text: "Name: ${dataController.user.value.firstName} ${dataController.user.value.lastName}"),
                    UserDetailsText(text: "Mobile: ${dataController.user.value.mobileNumber}"),
                    UserDetailsText(text: "Email: ${dataController.user.value.email}"),
                    UserDetailsText(text: "Shopping Address: ${dataController.user.value.shippingAddress}${dataController.user.value.city != null ? ", ${dataController.user.value.city}" : ""}"),
                  ],
                ),
              ),
      ),
    );
  }
}

class UserDetailsText extends StatelessWidget {
  final String text;
  const UserDetailsText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: defaultSubtitle2.copyWith(color: defaultBlackColor, height: 1.5),
    );
  }
}
