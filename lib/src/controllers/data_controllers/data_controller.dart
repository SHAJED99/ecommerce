import 'package:ecommerce/src/controllers/services/api/api_services.dart';
import 'package:ecommerce/src/controllers/services/handle_error/error_handler.dart';
import 'package:ecommerce/src/controllers/services/local_data/local_data.dart';
import 'package:ecommerce/src/models/pojo_classes/category_model.dart';
import 'package:ecommerce/src/models/pojo_classes/product_list_slider_model.dart';
import 'package:ecommerce/src/models/pojo_classes/product_model.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  final LocalData _localData = Get.put(LocalData());

  RxString token = "".obs;
  RxList<ProductListSliderModel> carouselProductList = RxList<ProductListSliderModel>();
  RxList<CategoryModel> categoryList = RxList<CategoryModel>();
  RxList<ProductCardModel> popularProductList = RxList<ProductCardModel>();
  RxList<ProductCardModel> specialProductList = RxList<ProductCardModel>();
  RxList<ProductCardModel> newProductList = RxList<ProductCardModel>();

  RxBool isError = false.obs;

  Future<void> initApp() async {
    token.value = await _localData.initData();
    loadData();
  }

  Future<void> loadData() async {
    await _errorHandler(function: () async {
      await getHomeCarouselSlider();
      await getCategoryList();
      await getPopularList();
      await getSpecialList();
      await getNewList();
    });
  }

  // Load home page carousel
  Future<void> getHomeCarouselSlider() async {
    carouselProductList.value = await ApiServices.productListSlider();
  }

  // Load category list
  Future<void> getCategoryList() async {
    categoryList.value = await ApiServices.productCategory();
  }

  // Load popular list
  Future<void> getPopularList() async {
    popularProductList.value = await ApiServices.listProductByRemark("popular");
  }

  // Load special list
  Future<void> getSpecialList() async {
    specialProductList.value = await ApiServices.listProductByRemark("special");
  }

  // Load new list
  Future<void> getNewList() async {
    newProductList.value = await ApiServices.listProductByRemark("new");
  }

  // Logout
  Future<void> logout() async {
    _localData.deleteUserData();
  }

  Future<List<ProductCardModel>> getProductListByCategory(String id) async {
    List<ProductCardModel> productList = [];
    await _errorHandler(function: () async {
      productList = await ApiServices.listProductByCategory(id);
    });
    return productList;
  }

  Future<void> _errorHandler({required Function function}) async {
    ErrorType errorType = await ErrorHandler.errorHandler(() async => function());
    if (errorType == ErrorType.invalidUser) logout();
  }
}
