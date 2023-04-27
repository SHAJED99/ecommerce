import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/models/pojo_classes/product_model.dart';
import 'package:get/get.dart';

class CartScreenController extends GetxController {
  final DataController dataController = Get.find();
  RxBool isLoading = false.obs;

  Future<ProductDetails> getProductDetails(String productId) async {
    isLoading.value = true;
    return await dataController.getProductDetailsById(productId).then((value) {
      isLoading.value = false;
      return value;
    });
  }
}
