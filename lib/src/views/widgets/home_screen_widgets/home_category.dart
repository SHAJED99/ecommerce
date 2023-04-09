import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/controllers/screen_controllers/wrapper_screen_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/models/pojo_classes/page_index.dart';
import 'package:ecommerce/src/views/widgets/category_card.dart';
import 'package:ecommerce/src/views/widgets/home_screen_widgets/home_section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategory extends StatelessWidget {
  HomeCategory({super.key});
  final DataController dataController = Get.find();
  final MainScreenWrapperController mainScreenWrapperController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeSectionTitle(
            categoriesName: "All Category",
            onTap: () {
              mainScreenWrapperController.changeIndex(index: PageEnum.categories);
            }),
        Obx(() => AnimatedSize(
              duration: const Duration(milliseconds: defaultDuration),
              child: dataController.isError.value && dataController.categoryList.isEmpty
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
                          for (int i = 0; i < 4 && i < dataController.categoryList.length; i++)
                            Expanded(
                              child: Center(
                                child: CategoryCard(
                                  categoryModel: dataController.categoryList.elementAt(i),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
            ))
      ],
    );
  }
}
