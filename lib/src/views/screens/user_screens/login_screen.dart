import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:ecommerce/src/views/widgets/text_field_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(defaultPadding * 2),
                constraints: const BoxConstraints(maxWidth: 400),
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
                        hintText: "Email Address",
                        fillColor: Theme.of(context).canvasColor,
                        validator: (value) {
                          if (kDebugMode) print(value);
                          return "Invalid input";
                        },
                      ),
                      const SizedBox(height: defaultPadding),
                      CustomElevatedButton(
                        onTap: () {
                          if (kDebugMode) print(_form.currentState!.validate());
                        },
                      ),
                    ],
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
