import 'package:ecommerce/src/models/pojo_classes/return_type.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ecommerce/src/controllers/services/api/api_services.dart';
import 'package:ecommerce/src/controllers/services/handle_error/app_exceptions.dart';
import 'package:ecommerce/src/controllers/services/handle_error/error_handler.dart';
import 'package:ecommerce/src/controllers/services/local_data/local_data.dart';
import 'package:ecommerce/src/models/pojo_classes/category_model.dart';
import 'package:ecommerce/src/models/pojo_classes/product_list_slider_model.dart';
import 'package:ecommerce/src/models/pojo_classes/product_model.dart';
import 'package:ecommerce/src/models/pojo_classes/user_model.dart';
import 'package:ecommerce/src/views/screens/user_screens/login_screen.dart';

class DataController extends GetxController {
  final LocalData _localData = Get.put(LocalData());
  RxString token = "".obs;
  Rx<UserModel?> user = null.obs;
  RxList<ProductListSliderModel> carouselProductList = RxList<ProductListSliderModel>();
  RxList<CategoryModel> categoryList = RxList<CategoryModel>();
  RxList<ProductCardModel> popularProductList = RxList<ProductCardModel>();
  RxList<ProductCardModel> specialProductList = RxList<ProductCardModel>();
  RxList<ProductCardModel> newProductList = RxList<ProductCardModel>();
  RxBool isRequesting = false.obs;
  RxBool isError = false.obs;

  // Error handler
  // return ReturnType class where value is T and isValid = true if ErrorType.done
  Future<ReturnType<T>> _errorHandler<T>({bool showError = true, required Function function}) async {
    isRequesting.value = true;
    dynamic value;
    ErrorType errorType = await ErrorHandler.errorHandler(function: () async => value = await function(), showError: showError);
    if (errorType == ErrorType.invalidUser) _loadLoginScreen();
    isRequesting.value = false;
    return ReturnType<T>(value: value, isValid: errorType == ErrorType.done ? true : false);
  }

  //* 0 App initializing function (On startup initialization) //////////////////
  Future<void> initApp() async {
    token.value = await _localData.initData();
    token.listen((value) {
      if (kDebugMode) print("DataController.tokenListener: Token: $value");
      _localData.setToken(value);
    });
  }

  Future<void> loadData() async {
    await _errorHandler(function: () async {
      await _getHomeCarouselSlider();
      await _getCategoryList();
      await _getPopularList();
      await _getSpecialList();
      await _getNewList();
    });
  }
  //////////////////////////////////////////////////////////////////////////////

  //* 1 App Auth (Login logout status) /////////////////////////////////////////
  // return true request successful
  Future<bool> login(String email) async => await _errorHandler(function: () async => await ApiServices.login(email)).then((value) => value.isValid);

  // return true request successful
  Future<bool> otpVerification({required String email, required String otp}) async => await _errorHandler(function: () async => token.value = await ApiServices.otpVerification(email, otp)).then((value) => value.isValid);

  // return user model
  Future<UserModel> tokenValidation() async => await _errorHandler<UserModel>(function: () async => await ApiServices.userInformation(token.value), showError: false).then((value) => value.value);

  // Logout
  void logout() => token.value = "";

  // auto logout and shift to the login page when error with 401 statue code
  void _loadLoginScreen() {
    logout();
    Get.to(() => LoginScreen());
  }
  //////////////////////////////////////////////////////////////////////////////

  //* 2 App Function (Without token user) //////////////////////////////////////
  // Load home page carousel
  Future<void> _getHomeCarouselSlider() async => carouselProductList.value = await ApiServices.productListSlider();

  // Load category list
  Future<void> _getCategoryList() async => categoryList.value = await ApiServices.productCategory();

  // Load popular list
  Future<void> _getPopularList() async => popularProductList.value = await ApiServices.listProductByRemark("popular");

  // Load special list
  Future<void> _getSpecialList() async => specialProductList.value = await ApiServices.listProductByRemark("special");

  // Load new list
  Future<void> _getNewList() async => newProductList.value = await ApiServices.listProductByRemark("new");

  // get Product Details By Id
  Future<ProductDetails> getProductDetailsById(String productId) async => await _errorHandler<ProductDetails>(function: () async => await ApiServices.getProductDetailsById(productId)).then((value) => value.value);

  // get Product List By Category
  Future<List<ProductCardModel>> getProductListByCategory(String id) async => await _errorHandler<List<ProductCardModel>>(function: () async => await ApiServices.listProductByCategory(id)).then((value) => value.value);
  //////////////////////////////////////////////////////////////////////////////

  // add to cart
  Future<bool> addToCart({required int productId, required String color, required String size}) async {
    if (token.isEmpty) {
      InvalidUser();
      _loadLoginScreen();
    }
    return true;
  }
}
