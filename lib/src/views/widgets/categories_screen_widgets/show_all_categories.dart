import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/controllers/screen_controllers/wrapper_screen_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowAllCategoriesScreen extends StatelessWidget {
  ShowAllCategoriesScreen({super.key});
  final DataController dataController = Get.find();
  final MainScreenWrapperController mainScreenWrapperController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: defaultPadding / 4, right: defaultPadding / 4, bottom: defaultPadding),
      child: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return SingleChildScrollView(
          child: Wrap(
            children: dataController.categoryList
                .map(
                  (element) => Container(
                    alignment: Alignment.center,
                    width: boxConstraints.maxWidth / 4,
                    child: CategoryCard(
                      categoryModel: element,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      }),
    );
  }
}
