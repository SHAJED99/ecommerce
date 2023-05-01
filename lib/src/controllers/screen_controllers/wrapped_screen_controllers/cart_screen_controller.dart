import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/controllers/services/handle_error/app_exceptions.dart';
import 'package:ecommerce/src/models/pojo_classes/product_model.dart';
import 'package:ecommerce/src/views/screens/user_screens/login_screen.dart';
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

  Future<bool> addToCart({required int productId, required String color, required String size}) async {
    return dataController.addToCart(productId: productId, color: color, size: size);
    // return true;
  }
}
