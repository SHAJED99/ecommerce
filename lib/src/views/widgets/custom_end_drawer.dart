import 'package:ecommerce/src/controllers/services/user_message/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/screens/user_screens/login_screen.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:ecommerce/src/views/widgets/user_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EndDrawer extends StatelessWidget {
  final DataController dataController = Get.find();
  EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).canvasColor, borderRadius: const BorderRadius.horizontal(left: Radius.circular(defaultPadding))),
      constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
      margin: const EdgeInsets.only(left: defaultPadding * 4),
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(minHeight: boxConstraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Main content will be here
                Column(
                  children: [UserDetails()],
                ),
                Row(
                  children: [
                    // Login Logout
                    Expanded(
                      child: CustomElevatedButton(
                        margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                        expanded: true,
                        onTap: () async {
                          if (dataController.token.isNotEmpty) {
                            bool res = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: const Text('Do you really want to change email address?'),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () => Get.back(result: false),
                                        //return false when click on "NO"
                                        child: const Text('No'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () => Get.back(result: true),
                                        //return true when click on "Yes"
                                        child: const Text('Yes'),
                                      ),
                                    ],
                                  ),
                                ) ??
                                false;
                            if (res) dataController.logout();
                          } else {
                            Get.to(() => LoginScreen());
                          }
                          return;
                        },
                        child: Obx(() => Text(dataController.token.isEmpty ? "Login" : "Logout", style: buttonText1)),
                      ),
                    ),
                    const SizedBox(width: defaultPadding / 2),
                    //* About Me
                    CustomElevatedButton(
                      expanded: true,
                      backgroundColor: Theme.of(context).primaryColor.withOpacity(1),
                      onTap: () async {
                        try {
                          await launchUrl(Uri.parse("https://docs.google.com/document/d/1GOM3gb-5Bw5v9gmMLBl3QdONGnAGf-uvmZZYZ949J0A/edit?usp=sharing"));
                          return true;
                        } catch (e) {
                          showSnackBar(title: "About me", message: "Go to this link => https://docs.google.com/document/d/1GOM3gb-5Bw5v9gmMLBl3QdONGnAGf-uvmZZYZ949J0A/edit?usp=sharing");
                          return false;
                        }
                      },
                      child: const Text("About me", style: buttonText1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
