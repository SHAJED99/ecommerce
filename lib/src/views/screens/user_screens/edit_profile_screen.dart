import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/models/pojo_classes/user_model.dart';
import 'package:ecommerce/src/views/screens/user_screens/login_screen.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:ecommerce/src/views/widgets/custom_save_area.dart';
import 'package:ecommerce/src/views/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _form = GlobalKey<FormState>();
  final DataController dataController = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (dataController.token.isEmpty) Get.off(() => LoginScreen());
    });
  }

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
                      // firstName
                      CustomTextFormField(
                        labelText: "First Name",
                        initialValue: dataController.user.value?.firstName,
                        fillColor: defaultWhiteColor,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: defaultPadding),
                      // lastName
                      CustomTextFormField(
                        labelText: "Last Name",
                        initialValue: dataController.user.value?.lastName,
                        fillColor: defaultWhiteColor,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: defaultPadding),
                      // Mobile
                      CustomTextFormField(
                        labelText: "Mobile",
                        initialValue: dataController.user.value?.mobileNumber,
                        fillColor: defaultWhiteColor,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: defaultPadding),
                      // City
                      CustomTextFormField(
                        labelText: "City",
                        initialValue: dataController.user.value?.city,
                        fillColor: defaultWhiteColor,
                        keyboardType: TextInputType.streetAddress,
                      ),
                      const SizedBox(height: defaultPadding),
                      // Shipping Address
                      CustomTextFormField(
                        labelText: "Shipping Address",
                        initialValue: dataController.user.value?.shippingAddress,
                        fillColor: defaultWhiteColor,
                        keyboardType: TextInputType.streetAddress,
                        contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
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
