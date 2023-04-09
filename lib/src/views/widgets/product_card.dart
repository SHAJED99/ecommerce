import 'package:ecommerce/src/controllers/screen_controllers/wrapper_screen_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/models/pojo_classes/page_index.dart';
import 'package:ecommerce/src/models/pojo_classes/product_model.dart';
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
                    child: Image.network(
                      productModel.image ?? "",
                      errorBuilder: (context, error, stackTrace) => FittedBox(
                        child: Icon(Icons.no_photography, color: Theme.of(context).cardColor),
                      ),
                    )),
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
                        Container(
                            padding: const EdgeInsets.all(defaultPadding / 16),
                            decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(defaultPadding / 4)),
                            height: defaultSubtitle2.fontSize! + 4,
                            child: FittedBox(child: Icon(Icons.favorite_border, color: Theme.of(context).cardColor)))
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
                  mainScreenWrapperController.changeIndex(index: PageEnum.cart);
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
