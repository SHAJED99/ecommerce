import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/models/pojo_classes/product_model.dart';
import 'package:ecommerce/src/views/widgets/cart_screen_widgets/cart_product_details.dart';
import 'package:ecommerce/src/views/widgets/custom_message_show.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  final ProductCardModel? productCardModel;

  const CartScreen({super.key, this.productCardModel});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.productCardModel != null) {
      return ProductDetailsScreen(productID: widget.productCardModel?.id ?? 0);
    } else {
      final DataController dataController = Get.find();
      if (dataController.token.isEmpty) {
        return NeedLoginToAccess();
      } else {
        return Container();
      }
    }
  }
}
