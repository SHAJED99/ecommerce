import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/screens/user_screens/otp_screen.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:ecommerce/src/views/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _form = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(defaultPadding * 2),
                  constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
                  child: Form(
                    key: _form,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // logo
                        Container(constraints: const BoxConstraints(maxHeight: defaultNavBarHeight * 2), child: SvgPicture.asset("lib/assets/svg/logo.svg")),
                        const SizedBox(height: defaultPadding / 2),
                        Text("Welcome Back", style: defaultCarouselTitle.copyWith(color: defaultBlackColor)),
                        const SizedBox(height: defaultPadding / 2),
                        const Text("Please enter your email address", style: defaultSubtitle1),
                        const SizedBox(height: defaultPadding),
                        CustomTextFormField(
                          textEditingController: _textEditingController,
                          hintText: "Email Address",
                          fillColor: defaultWhiteColor,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) return "Invalid email address";
                          },
                        ),
                        const SizedBox(height: defaultPadding),
                        CustomElevatedButton(
                          expanded: true,
                          onTap: () async {
                            if (_form.currentState!.validate()) {
                              return await dataController.login(_textEditingController.text);
                            }
                            return null;
                          },
                          onDone: (isSuccess) {
                            if (isSuccess ?? false) {
                              Get.to(() => OTPScreen(email: _textEditingController.text));
                            }
                          },
                          child: const Text("Next", style: buttonText1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
