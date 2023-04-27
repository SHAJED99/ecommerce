import 'package:ecommerce/src/controllers/screen_controllers/wrapper_screen_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/models/pojo_classes/page_index.dart';
import 'package:ecommerce/src/models/pojo_classes/product_model.dart';
import 'package:ecommerce/src/views/screens/main_screen/cart_screen.dart';
import 'package:ecommerce/src/views/widgets/custom_image_field.dart';
import 'package:ecommerce/src/views/widgets/custom_top_app_bar.dart';
import 'package:ecommerce/src/views/widgets/react_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final ProductCardModel productModel;
  final MainScreenWrapperController mainScreenWrapperController = Get.find();

  ProductCard({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: defaultCarouselHeight,
      margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(defaultPadding / 2), boxShadow: defaultBoxShadowDown, color: Theme.of(context).canvasColor),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(defaultPadding / 2),
                color: Theme.of(context).primaryColorLight,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CustomNetworkImage(image: productModel.image ?? ""),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2, vertical: defaultPadding / 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title ?? "",
                      style: defaultSubtitle2.copyWith(color: defaultBlackColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: defaultPadding / 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // price tag
                        Text("\$${productModel.price ?? 0}", style: defaultSubtitle2.copyWith(color: Theme.of(context).primaryColor, height: 1)),

                        // Rating
                        Row(
                          children: [
                            SizedBox(
                              height: defaultSubtitle2.fontSize,
                              child: const FittedBox(
                                child: Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                ),
                              ),
                            ),
                            const SizedBox(width: defaultPadding / 4),
                            Text((productModel.star ?? 0).toString(), style: defaultSubtitle2.copyWith(color: defaultBlackColor, height: 1)),
                          ],
                        ),

                        // React Button
                        const CustomReactButton(),
                      ],
                    ),
                    const SizedBox(height: defaultPadding / 2),
                  ],
                ),
              )
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  mainScreenWrapperController.changeIndex(
                      index: PageEnum.cart,
                      topNavBar: CustomTopAppBar2(
                        title: "Product Details",
                        color: defaultGreyColor.withOpacity(0.2),
                        boxShadow: const [],
                      ),
                      page: CartScreen(
                        productCardModel: productModel,
                      ));
                },
                child: Container(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
