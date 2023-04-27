import 'package:ecommerce/src/models/pojo_classes/product_model.dart';
import 'package:ecommerce/src/views/widgets/cart_screen_widgets/cart_product_details.dart';
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
    return ProductDetailsScreen(
      productID: widget.productCardModel?.id ?? 23,
    );
  }
}
