import 'package:ecommerce/src/controllers/screen_controllers/wrapper_screen_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/models/pojo_classes/category_model.dart';
import 'package:ecommerce/src/models/pojo_classes/page_index.dart';
import 'package:ecommerce/src/views/screens/main_screen/categories_screen.dart';
import 'package:ecommerce/src/views/widgets/custom_image_field.dart';
import 'package:ecommerce/src/views/widgets/custom_top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;

  CategoryCard({super.key, required this.categoryModel});

  final MainScreenWrapperController mainScreenWrapperController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: defaultCarouselHeight / 1.5),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(defaultPadding / 4),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: FittedBox(
                    child: CustomNetworkImage(
                      image: categoryModel.categoryImg,
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(categoryModel.categoryName, style: defaultSubtitle1.copyWith(color: Theme.of(context).primaryColor)),
              ],
            ),
          ),
          Positioned.fill(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(defaultPadding / 2)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    mainScreenWrapperController.changeIndex(
                      index: PageEnum.categories,
                      page: CategoriesScreen(categoryModel: categoryModel),
                      topNavBar: CustomTopAppBar2(title: categoryModel.categoryName),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
