import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';

class CartCheckout extends StatelessWidget {
  final Future<bool?>? Function()? onTap;
  final dynamic Function(bool? isSuccess)? onDone;
  final String heading;
  final String price;
  final String buttonText;
  const CartCheckout({
    super.key,
    this.onTap,
    this.onDone,
    required this.heading,
    required this.price,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(defaultPadding)),
      ),
      child: Container(
        color: Theme.of(context).primaryColorLight,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding * 1.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(heading, style: defaultSubtitle2.copyWith(color: defaultBlackColor)),
                  const SizedBox(height: defaultPadding / 2),
                  Text("\$$price", style: buttonText1.copyWith(color: Theme.of(context).primaryColor)),
                ],
              ),
              CustomElevatedButton(
                onDone: onDone,
                onTap: onTap,
                child: Text(
                  buttonText,
                  style: buttonText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
