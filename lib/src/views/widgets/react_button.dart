import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';

class CustomReactButton extends StatelessWidget {
  final Future<bool?>? Function()? onTap;
  const CustomReactButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onTap: onTap,
      height: defaultPadding,
      width: defaultPadding,
      borderRadius: BorderRadius.circular(4),
      contentPadding: const EdgeInsets.all(defaultPadding / 8),
      child: FittedBox(child: Icon(Icons.favorite_border, color: Theme.of(context).cardColor)),
    );
  }
}
