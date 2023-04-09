import 'package:ecommerce/src/controllers/screen_controllers/wrapped_screen_controllers/home_screen_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/widgets/home_screen_widgets/home_carousel.dart';
import 'package:ecommerce/src/views/widgets/home_screen_widgets/home_category.dart';
import 'package:ecommerce/src/views/widgets/home_screen_widgets/home_new_product.dart';
import 'package:ecommerce/src/views/widgets/home_screen_widgets/home_popular_product.dart';
import 'package:ecommerce/src/views/widgets/home_screen_widgets/home_special_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeScreenController homeScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) => RefreshIndicator(
        onRefresh: () async {
          await homeScreenController.loadData();
        },
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: boxConstraints.maxHeight + 0.0001),
              child: Column(
                children: [
                  HomeCarousel(),
                  HomeCategory(),
                  const SizedBox(height: defaultPadding),
                  HomePopularProduct(),
                  const SizedBox(height: defaultPadding),
                  HomeSpecialProduct(),
                  const SizedBox(height: defaultPadding),
                  HomeNewProduct(),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
