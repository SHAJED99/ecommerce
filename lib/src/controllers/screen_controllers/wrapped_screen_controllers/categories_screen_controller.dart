import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/models/pojo_classes/product_model.dart';
import 'package:ecommerce/src/views/widgets/product_card.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CategoriesScreenController extends GetxController {
  final DataController dataController = Get.find();
  RxList<ProductCardModel> categoryProductList = RxList<ProductCardModel>();
  RxBool isLoading = false.obs;

  CategoriesScreenController() {
    if (kDebugMode) print("CategoriesScreenController initialized");
  }
  getProductListByCategoryName({required String categoryID}) async {
    isLoading.value = true;
    categoryProductList.value = await dataController.getProductListByCategory(categoryID);
    isLoading.value = false;
  }
}
