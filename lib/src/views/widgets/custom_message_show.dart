import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:flutter/material.dart';

class CustomMessageBarNoItemHere extends StatelessWidget {
  const CustomMessageBarNoItemHere({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "No item here",
      style: defaultSubtitle1.copyWith(height: 1, color: defaultBlackColor),
    );
  }
}

class NeedLoginToAccess extends StatelessWidget {
  const NeedLoginToAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
