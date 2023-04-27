import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/models/pojo_classes/product_list_slider_model.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:ecommerce/src/views/widgets/custom_image_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeCarouselCard extends StatelessWidget {
  final ProductListSliderModel productListSliderModel;
  final Function() onPress;
  const HomeCarouselCard({super.key, required this.productListSliderModel, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
      margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(defaultPadding / 2), color: Theme.of(context).primaryColor),
      child: LayoutBuilder(
        builder: (context, boxConstraints) {
          double width = boxConstraints.maxWidth - defaultPadding;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedSize(
                alignment: Alignment.centerLeft,
                duration: const Duration(milliseconds: defaultDuration),
                child: Container(
                  constraints: BoxConstraints(maxWidth: width / 2),
                  child: CustomNetworkImage(image: productListSliderModel.image, width: defaultBoxHeight),
                ),
              ),
              const SizedBox(width: defaultPadding),
              Flexible(
                child: Container(
                  // alignment: Alignment.centerLeft,
                  constraints: BoxConstraints(maxWidth: width / 4 * 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productListSliderModel.title.replaceAll("\n", " "),
                        style: defaultCarouselTitle,
                        maxLines: 3,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: defaultPadding / 2),
                      CustomElevatedButton(
                        onTap: () {
                          if (kDebugMode) print("Showing product id ${productListSliderModel.id}");
                          onPress();
                          return;
                        },
                        width: boxConstraints.maxWidth / 3,
                        constraints: const BoxConstraints(maxWidth: defaultCarouselHeight),
                        expanded: true,
                        backgroundColor: Theme.of(context).cardColor,
                        child: Text("Buy Now", textAlign: TextAlign.center, style: buttonText1.copyWith(color: Theme.of(context).primaryColor)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
