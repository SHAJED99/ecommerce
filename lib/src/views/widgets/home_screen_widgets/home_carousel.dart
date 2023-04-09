import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/controllers/screen_controllers/wrapper_screen_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/models/pojo_classes/page_index.dart';
import 'package:ecommerce/src/views/widgets/custom_carousel_widget.dart';
import 'package:ecommerce/src/views/widgets/home_screen_widgets/home_carousel_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCarousel extends StatelessWidget {
  HomeCarousel({super.key});

  final MainScreenWrapperController mainScreenWrapperController = Get.find();
  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSize(
          duration: const Duration(milliseconds: defaultDuration),
          child: dataController.carouselProductList.isEmpty
              ? Container()
              : CustomCarousel(
                  productList: dataController.carouselProductList,
                  onBuild: (element) => HomeCarouselCard(
                    productListSliderModel: element.value,
                    onPress: () => mainScreenWrapperController.changeIndex(
                      index: PageEnum.categories,
                    ),
                  ),
                )),
    );
  }
}
