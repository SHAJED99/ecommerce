import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/models/pojo_classes/product_model.dart';
import 'package:ecommerce/src/views/widgets/custom_carousel_widget.dart';
import 'package:ecommerce/src/views/widgets/custom_image_field.dart';
import 'package:flutter/material.dart';

class CartCarousel extends StatelessWidget {
  const CartCarousel({
    super.key,
    required this.productDetails,
  });

  final ProductDetails? productDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: defaultGreyColor.withOpacity(0.2),
      child: CustomCarousel<String>(
        dotBorder: Border.all(color: Colors.transparent),
        productList: [
          // Carousel images
          productDetails?.img1 ?? "",
          productDetails?.img2 ?? "",
          productDetails?.img3 ?? "",
          productDetails?.img4 ?? "",
        ],
        onBuild: (element) {
          return CustomNetworkImage(image: element.value);
        },
      ),
    );
  }
}
