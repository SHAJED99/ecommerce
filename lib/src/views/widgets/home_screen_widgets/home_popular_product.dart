import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/controllers/screen_controllers/wrapper_screen_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/widgets/home_screen_widgets/home_section_title.dart';
import 'package:ecommerce/src/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePopularProduct extends StatelessWidget {
  HomePopularProduct({super.key});

  final DataController dataController = Get.find();
  final MainScreenWrapperController mainScreenWrapperController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeSectionTitle(categoriesName: "Popular", onTap: () {}),
        Obx(() => AnimatedSize(
              duration: const Duration(milliseconds: defaultDuration),
              child: dataController.isError.value && dataController.popularProductList.isEmpty
                  ? SizedBox(
                      height: defaultBoxHeight,
                      child: Icon(
                        Icons.error_outline,
                        color: Theme.of(context).colorScheme.error,
                      ))
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
                      child: Row(
                        children: [
                          for (int i = 0; i < 3 && i < dataController.popularProductList.length; i++)
                            Expanded(
                              child: Center(
                                child: ProductCard(
                                  productModel: dataController.popularProductList.elementAt(i),
                                  // onTap: () {
                                  //   // mainScreenWrapperController.changeIndex(index: PageEnum.categories, widget: Container());
                                  // },
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
            ))
      ],
    );
  }
}
