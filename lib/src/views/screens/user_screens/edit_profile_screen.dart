import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/models/pojo_classes/user_model.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:ecommerce/src/views/widgets/custom_save_area.dart';
import 'package:ecommerce/src/views/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key, this.userModel});
  final UserModel? userModel;
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: CustomSafeArea(
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
                      Text("Complete Profile", style: defaultCarouselTitle.copyWith(color: defaultBlackColor)),
                      const SizedBox(height: defaultPadding / 2),
                      const Text("Get started with us with your details", style: defaultSubtitle1),
                      const SizedBox(height: defaultPadding),
                      const CustomTextFormField(
                        hintText: "First Name",
                        fillColor: defaultWhiteColor,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: defaultPadding),
                      const CustomTextFormField(
                        hintText: "Last Name",
                        fillColor: defaultWhiteColor,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: defaultPadding),
                      const CustomTextFormField(
                        hintText: "Mobile",
                        fillColor: defaultWhiteColor,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: defaultPadding),
                      const CustomTextFormField(
                        hintText: "City",
                        fillColor: defaultWhiteColor,
                        keyboardType: TextInputType.streetAddress,
                      ),
                      const SizedBox(height: defaultPadding),
                      const CustomTextFormField(
                        hintText: "Shipping Address",
                        fillColor: defaultWhiteColor,
                        keyboardType: TextInputType.streetAddress,
                        contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
                        minLines: 3,
                        maxLines: 3,
                        height: null,
                      ),
                      const SizedBox(height: defaultPadding),
                      const CustomElevatedButton(
                        expanded: true,
                        child: Text("Complete", style: buttonText1),
                      )
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
