import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';

class CartCheckout extends StatelessWidget {
  const CartCheckout({
    super.key,
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
                  Text("Total Price:", style: defaultSubtitle2.copyWith(color: defaultBlackColor)),
                  const SizedBox(height: defaultPadding / 2),
                  Text("\$${1000}", style: buttonText1.copyWith(color: Theme.of(context).primaryColor)),
                ],
              ),
              const CustomElevatedButton(
                child: Text(
                  "Checkout",
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
