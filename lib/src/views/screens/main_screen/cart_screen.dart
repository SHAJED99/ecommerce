import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/models/pojo_classes/product_model.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final ProductCardModel? productCardModel;
  const CartScreen({super.key, this.productCardModel});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(defaultPadding)),
            ),
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
                  )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
