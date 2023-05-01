import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:flutter/material.dart';

class CartTitleText extends StatelessWidget {
  final String text;
  const CartTitleText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: buttonText1.copyWith(color: defaultBlackColor));
  }
}
