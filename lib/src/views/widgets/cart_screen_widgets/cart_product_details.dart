import 'package:ecommerce/src/controllers/screen_controllers/wrapped_screen_controllers/cart_screen_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/models/pojo_classes/product_model.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_text_button.dart';
import 'package:ecommerce/src/views/widgets/cart_screen_widgets/cart_carousel.dart';
import 'package:ecommerce/src/views/widgets/cart_screen_widgets/cart_checkout.dart';
import 'package:ecommerce/src/views/widgets/cart_screen_widgets/cart_quantity_counter.dart';
import 'package:ecommerce/src/views/widgets/cart_screen_widgets/color_selection.dart';
import 'package:ecommerce/src/views/widgets/cart_screen_widgets/size_selection.dart';
import 'package:ecommerce/src/views/widgets/custom_loading_bar.dart';
import 'package:ecommerce/src/views/widgets/custom_message_show.dart';
import 'package:ecommerce/src/views/widgets/react_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productID;

  const ProductDetailsScreen({super.key, required this.productID});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final CartScreenController cartScreenController = Get.find();
  ProductDetails? productDetails;

  @override
  void initState() {
    super.initState();
    cartScreenController.getProductDetails(widget.productID.toString()).then((value) {
      if (mounted) {
        setState(() => productDetails = value);
      }
    });
  }

  List<String> colors() {
    List<String> res = [];
    res.addAll(productDetails?.color?.split(',') ?? []);
    return res;
  }

  List<String> sizes() {
    List<String> res = [];
    res.addAll(productDetails?.size?.split(',') ?? []);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
      return Obx(
        () {
          if (cartScreenController.isLoading.value) {
            return const Center(child: CustomCircularProgressBar());
          } else if (!cartScreenController.isLoading.value && productDetails == null) {
            return const CustomMessageBarNoItemHere();
          }
          // Showing details
          else {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    constraints: BoxConstraints(minHeight: boxConstraints.maxHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Carousel
                        CartCarousel(productDetails: productDetails),
                        const SizedBox(height: defaultPadding / 2),
                        Padding(
                          padding: const EdgeInsets.only(left: defaultPadding, right: defaultPadding, top: defaultPadding / 2, bottom: defaultBoxHeight * 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 1
                              Row(
                                children: [
                                  // Title
                                  Expanded(child: CartTitleText(text: productDetails?.productCardModel?.title ?? "")),
                                  const SizedBox(width: defaultPadding),
                                  // Cart Quantity
                                  const CartQuantityCounter(),
                                ],
                              ),
                              const SizedBox(height: defaultPadding / 2),
                              // 2
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: defaultPadding,
                                  ),
                                  const SizedBox(width: defaultPadding / 3),
                                  // Rating text
                                  Text(
                                    "4.8",
                                    style: defaultSubtitle1.copyWith(color: defaultBlackColor, height: 1),
                                  ),
                                  const SizedBox(width: defaultPadding / 2),
                                  // Review button
                                  CustomTextButton(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2, vertical: defaultPadding / 4),
                                    child: Text(
                                      "Reviews",
                                      style: defaultSubtitle1.copyWith(color: Theme.of(context).primaryColor, height: 1),
                                    ),
                                  ),
                                  const SizedBox(width: defaultPadding / 2),
                                  // React Button
                                  const CustomReactButton(),
                                ],
                              ),
                              const SizedBox(height: defaultPadding),
                              // 3
                              const CartTitleText(text: "Color"),
                              ColorSelection(colors: colors()),
                              const SizedBox(height: defaultPadding),
                              // 4
                              const CartTitleText(text: "Size"),
                              SizeSelection(sizes: sizes()),
                              const SizedBox(height: defaultPadding),
                              // 5
                              const CartTitleText(text: "Description"),
                              const SizedBox(height: defaultPadding / 2),
                              Text(
                                (productDetails?.des ?? "").replaceAll("\r\n", ""),
                                textAlign: TextAlign.justify,
                                style: defaultSubtitle1.copyWith(color: defaultBlackColor, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Checkout bar
                const Positioned(bottom: 0, left: 0, right: 0, child: CartCheckout()),
              ],
            );
          }
        },
      );
    });
  }
}

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
