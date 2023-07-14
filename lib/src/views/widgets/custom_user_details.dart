import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/models/pojo_classes/user_model.dart';
import 'package:ecommerce/src/views/screens/user_screens/edit_profile_screen.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:ecommerce/src/views/widgets/custom_loading_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final DataController dataController = Get.find();

  @override
  void initState() {
    super.initState();
    // loading user profile if error while init
    if (dataController.token.isNotEmpty && dataController.user.value == null) dataController.readProf();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSize(
        duration: const Duration(milliseconds: defaultDuration),
        child: dataController.token.value.isNotEmpty
            ? dataController.user.value == null
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),
                    child: CustomCircularProgressBar(),
                  )
                : UserDetailsCard(
                    user: dataController.user.value?.isValid() ?? false ? dataController.user.value : null,
                  )
            : const SizedBox(),
      ),
    );
  }
}

class UserDetailsCard extends StatelessWidget {
  const UserDetailsCard({
    super.key,
    this.user,
  });

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      enable: user == null,
      horizontalAlignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      boxShadow: defaultBoxShadowDown,
      backgroundColor: Theme.of(context).canvasColor,
      height: null,
      expanded: true,
      contentPadding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding),
      onDone: (isSuccess) => Get.to(() => const EditProfileScreen()),
      child: user == null
          ? Row(
              children: [
                const Icon(Icons.error, color: defaultErrorColor),
                const SizedBox(width: defaultPadding / 2),
                Expanded(
                    child: Text(
                  "Please complete your profile to place order.",
                  style: defaultSubtitle1.copyWith(color: defaultBlackColor),
                )),
              ],
            )
          : Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserDetailsText(text: "Name: ${user?.firstName ?? ""} ${user?.lastName ?? ""}"),
                      UserDetailsText(text: "Mobile: ${user?.mobileNumber ?? ""}"),
                      UserDetailsText(text: "Email: ${user?.email ?? ""}"),
                      UserDetailsText(text: "Shopping Address: ${user?.shippingAddress ?? ""}${user?.city != null ? ", ${user?.city}" : ""}"),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: CustomElevatedButton(
                    onTap: () => Get.to(() => const EditProfileScreen()),
                    borderRadius: BorderRadius.circular(100),
                    backgroundColor: Colors.transparent,
                    height: defaultPadding * 2,
                    width: defaultPadding * 2,
                    contentPadding: const EdgeInsets.all(defaultPadding / 2),
                    child: FittedBox(
                        child: Icon(
                      Icons.edit,
                      color: user?.isValid() ?? false ? defaultGreyColor : defaultErrorColor,
                    )),
                  ),
                ),
              ],
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
