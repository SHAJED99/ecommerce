import 'dart:async';

import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/controllers/services/functions/countdown.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/screens/user_screens/login_screen.dart';
import 'package:ecommerce/src/views/screens/wrapper_screen.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_text_button.dart';
import 'package:ecommerce/src/views/widgets/custom_card.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.email});
  final String email;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _form = GlobalKey<FormState>();
  final StreamController<ErrorAnimationType>? errorController = StreamController<ErrorAnimationType>();
  final DataController _dataController = Get.find();
  String inputValue = "";
  bool otpWaitDone = false;
  bool isSandingOTP = false;

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
                constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
                child: Form(
                  key: _form,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // logo
                      Container(constraints: const BoxConstraints(maxHeight: defaultNavBarHeight * 2), child: SvgPicture.asset("lib/assets/svg/logo.svg")),
                      const SizedBox(height: defaultPadding / 2),
                      Text("Enter OTP Code", style: defaultCarouselTitle.copyWith(color: defaultBlackColor)),
                      const SizedBox(height: defaultPadding / 2),
                      const Text("A 4 digit OTP code has been sent", style: defaultSubtitle1),
                      const SizedBox(height: defaultPadding),
                      // Pin Verification Field
                      Container(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: PinCodeTextField(
                          errorAnimationController: errorController,
                          appContext: context,
                          length: otpLength,
                          keyboardType: TextInputType.number,
                          cursorColor: Theme.of(context).primaryColor,
                          enableActiveFill: true,
                          errorTextSpace: 0,
                          animationDuration: const Duration(milliseconds: defaultDuration),
                          textStyle: buttonText1.copyWith(color: Theme.of(context).primaryColor),
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(defaultPadding / 2),
                            fieldHeight: defaultBoxHeight,
                            fieldWidth: defaultBoxHeight / 1.1,
                            // Border color
                            activeColor: Theme.of(context).primaryColor,
                            selectedColor: Theme.of(context).primaryColor,
                            inactiveColor: Theme.of(context).primaryColorLight,
                            // Fill color
                            activeFillColor: Theme.of(context).canvasColor,
                            selectedFillColor: Theme.of(context).cardColor,
                            inactiveFillColor: Theme.of(context).cardColor,
                            errorBorderColor: Colors.red,
                            disabledColor: Colors.red,
                          ),
                          onChanged: (value) => inputValue = value,
                        ),
                      ),
                      const SizedBox(height: defaultPadding * 2),
                      // Submit Button
                      CustomElevatedButton(
                        expanded: true,
                        height: defaultBoxHeight,
                        onTap: () async {
                          if (inputValue.length != otpLength) {
                            errorController!.add(ErrorAnimationType.shake);
                            return false;
                          } else {
                            return await _dataController.otpVerification(email: widget.email, otp: inputValue);
                          }
                        },
                        onDone: (isSuccess) {
                          if (isSuccess ?? false) Get.off(() => MainScreenWrapper());
                        },
                        child: const Text("Next", style: buttonText1),
                      ),
                      const SizedBox(height: defaultPadding * 2),
                      AnimatedSize(
                        duration: const Duration(milliseconds: defaultDuration),
                        child: otpWaitDone
                            ? Container()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("This code will expire in", style: defaultSubtitle2),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CountDown(
                                      duration: const Duration(seconds: defaultOtpResend),
                                      onCounting: (remainingTime) {
                                        if (remainingTime == const Duration(seconds: 0) && mounted) {
                                          setState(() => otpWaitDone = true);
                                        }
                                      },
                                      builder: (remainingTime) {
                                        return Text(
                                          "${remainingTime.inSeconds.toString().padLeft(2, "0")}s",
                                          style: defaultSubtitle1.copyWith(color: Theme.of(context).primaryColor),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                      ),
                      CustomElevatedButton(
                        iconColor: defaultGreyColor,
                        backgroundColor: Colors.transparent,
                        onErrorWidget: const Text("!", style: TextStyle(height: 1, color: defaultGreyColor)),
                        height: 28,
                        onTap: () async {
                          if (!otpWaitDone || isSandingOTP) return null;
                          isSandingOTP = true;
                          // bool res = await _dataController.login(widget.email);
                          bool res = false;
                          await Future.delayed(const Duration(seconds: 3));
                          isSandingOTP = false;
                          if (mounted) setState(() => otpWaitDone = false);
                          return res;
                        },
                        child: const Text(
                          "Resend Code",
                          style: defaultSubtitle1,
                        ),
                      ),
                      const SizedBox(height: defaultPadding / 4),
                      Builder(builder: (context) {
                        return CustomElevatedButton(
                          backgroundColor: Colors.transparent,
                          height: 24,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const PopupDialog();
                              },
                            );
                            return null;
                          },
                          child: const Text(
                            "Change email address?",
                            style: defaultSubtitle1,
                          ),
                        );
                      })
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

class PopupDialog extends StatelessWidget {
  const PopupDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: defaultMaxWidth),
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Center(
          child: CustomCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Do you really want to change email address?",
                  style: buttonText1.copyWith(color: defaultBlackColor),
                ),
                const SizedBox(height: defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextButton(
                      contentPadding: const EdgeInsets.symmetric(vertical: defaultPadding / 2, horizontal: defaultPadding),
                      onTap: () => Get.offAll(() => LoginScreen()),
                      child: Text(
                        "Yes",
                        style: buttonText1.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    const SizedBox(width: defaultPadding),
                    CustomTextButton(
                      contentPadding: const EdgeInsets.symmetric(vertical: defaultPadding / 2, horizontal: defaultPadding),
                      onTap: () => Get.back(),
                      child: Text(
                        "No",
                        style: buttonText1.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
