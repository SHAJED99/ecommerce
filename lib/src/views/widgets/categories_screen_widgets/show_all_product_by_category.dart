import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/controllers/screen_controllers/wrapped_screen_controllers/categories_screen_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/models/pojo_classes/category_model.dart';
import 'package:ecommerce/src/views/widgets/custom_loading_bar.dart';
import 'package:ecommerce/src/views/widgets/custom_message_show.dart';
import 'package:ecommerce/src/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowAllProductByCategory extends StatefulWidget {
  final CategoryModel categoryModel;
  const ShowAllProductByCategory({super.key, required this.categoryModel});

  @override
  State<ShowAllProductByCategory> createState() => _ShowAllProductByCategoryState();
}

class _ShowAllProductByCategoryState extends State<ShowAllProductByCategory> {
  final CategoriesScreenController categoriesScreenController = Get.find();
  final DataController dataController = Get.find();

  @override
  void initState() {
    super.initState();
    categoriesScreenController.categoryProductList.value = [];
    categoriesScreenController.getProductListByCategoryName(categoryID: widget.categoryModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (categoriesScreenController.isLoading.value && categoriesScreenController.categoryProductList.isEmpty) {
        return const Center(child: CustomCircularProgressBar());
      } else {
        if (!categoriesScreenController.isLoading.value && categoriesScreenController.categoryProductList.isEmpty) {
          return const Center(child: CustomMessageBarNoItemHere());
        } else {
          return LayoutBuilder(
            builder: (context, boxConstraints) {
              return RefreshIndicator(
                onRefresh: () async {
                  await categoriesScreenController.getProductListByCategoryName(categoryID: widget.categoryModel.id);
                },
                child: SingleChildScrollView(
                  child: Container(
                    width: boxConstraints.maxWidth,
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4, vertical: defaultPadding / 4),
                    constraints: BoxConstraints(minHeight: boxConstraints.maxHeight + 0.0001),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        for (int i = 0; i < categoriesScreenController.categoryProductList.length; i++)
                          FractionallySizedBox(
                            widthFactor: 1 / 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
                              child: Center(
                                child: ProductCard(
                                  productModel: categoriesScreenController.categoryProductList.elementAt(i),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }
    });
  }
}
