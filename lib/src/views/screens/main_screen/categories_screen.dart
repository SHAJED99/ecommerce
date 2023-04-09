import 'package:ecommerce/src/models/pojo_classes/category_model.dart';
import 'package:ecommerce/src/views/widgets/categories_screen_widgets/show_all_categories.dart';
import 'package:ecommerce/src/views/widgets/categories_screen_widgets/show_all_product_by_category.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  final CategoryModel? categoryModel;
  const CategoriesScreen({super.key, this.categoryModel});

  @override
  Widget build(BuildContext context) {
    if (categoryModel != null) {
      return ShowAllProductByCategory(categoryModel: categoryModel ?? CategoryModel(id: "", categoryName: "", categoryImg: ""));
    }

    return ShowAllCategoriesScreen();
  }
}
