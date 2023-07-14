import 'dart:convert';
import 'dart:ffi';

import 'package:ecommerce/src/controllers/services/api/http_call.dart';
import 'package:ecommerce/src/models/pojo_classes/category_model.dart';
import 'package:ecommerce/src/models/pojo_classes/product_list_slider_model.dart';
import 'package:ecommerce/src/models/pojo_classes/product_model.dart';
import 'package:ecommerce/src/models/pojo_classes/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<ProductListSliderModel>> productListSlider() async {
    if (kDebugMode) print("ApiServices: Requesting ApiServices.productListSlider()");
    const String httpLink = "/ListProductSlider";
    try {
      http.Response res = await HttpCall.get(httpLink);
      if (res.statusCode != 200) throw res.statusCode;
      var json = jsonDecode(res.body);
      List<ProductListSliderModel> data = [];
      if (json['data'] != null) {
        json['data'].forEach((v) {
          data.add(ProductListSliderModel.fromJson(v));
        });
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<CategoryModel>> productCategory() async {
    if (kDebugMode) print("ApiServices: Requesting ApiServices.productCategory()");
    const String httpLink = "/CategoryList";
    try {
      http.Response res = await HttpCall.get(httpLink);
      if (res.statusCode != 200) throw res.statusCode;
      var json = jsonDecode(res.body);
      List<CategoryModel> data = [];
      if (json['data'] != null) {
        json['data'].forEach((v) {
          data.add(CategoryModel.fromJson(v));
        });
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<ProductCardModel>> listProductByRemark(String remark) async {
    if (kDebugMode) print("ApiServices: Requesting ApiServices.listProductByRemark() for product remark $remark");
    String httpLink = "/ListProductByRemark/$remark";
    try {
      http.Response res = await HttpCall.get(httpLink);
      if (res.statusCode != 200) throw res.statusCode;
      var json = jsonDecode(res.body);
      List<ProductCardModel> data = [];
      if (json['data'] != null) {
        json['data'].forEach((v) {
          data.add(ProductCardModel.fromJson(v));
        });
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<ProductCardModel>> listProductByCategory(String categoryId) async {
    if (kDebugMode) print("ApiServices: Requesting ApiServices.listProductByCategory() for product category Id $categoryId");
    String httpLink = "/ListProductByCategory/$categoryId";
    try {
      http.Response res = await HttpCall.get(httpLink);
      if (res.statusCode != 200) throw res.statusCode;
      var json = jsonDecode(res.body);
      List<ProductCardModel> data = [];
      if (json['data'] != null) {
        json['data'].forEach((v) {
          data.add(ProductCardModel.fromJson(v));
        });
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }

  static Future login(String email) async {
    if (kDebugMode) print("ApiServices: Requesting ApiServices.login() for email: $email");
    String httpLink = "/UserLogin/";

    try {
      http.Response res = await HttpCall.get(httpLink + email);

      if (res.statusCode == 200 && jsonDecode(res.body)['msg'] == "success") return;
      throw res.statusCode;
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> otpVerification(String email, String otp) async {
    if (kDebugMode) print("ApiServices: Requesting ApiServices.otpVerification() for $email/$otp");
    String httpLink = "/VerifyLogin/";
    try {
      http.Response res = await HttpCall.get("$httpLink$email/$otp");
      var metaData = jsonDecode(res.body);
      if (res.statusCode == 200 && metaData['msg'] == "success" && metaData['data'] != null) return metaData['data'];
      throw res.statusCode;
    } catch (e) {
      rethrow;
    }
  }

  static Future<ProductDetails> getProductDetailsById(String id) async {
    if (kDebugMode) print("ApiServices: Requesting ApiServices.getProductDetailsById() for id: $id");
    String httpLink = "/ProductDetailsById/";

    try {
      http.Response res = await HttpCall.get("$httpLink$id");
      var metaData = jsonDecode(res.body);
      if (res.statusCode == 200 && metaData['msg'] == "success" && metaData['data'] != null) {
        return ProductDetails.fromJson(metaData['data'][0]);
      }
      throw res.statusCode;
    } catch (e) {
      rethrow;
    }
  }

  static Future<UserModel?> userInformation(String token) async {
    if (kDebugMode) print("ApiServices: Requesting ApiServices.userInformation");
    String httpLink = "/ReadProfile";
    try {
      http.Response res = await HttpCall.get(httpLink, token: token);
      var metaData = jsonDecode(res.body);

      if (res.statusCode == 200 && metaData['msg'] == "success" && metaData['data'] != null) {
        if (metaData['data'].isEmpty) return UserModel();
        return UserModel.fromJson(metaData['data'][0]);
        // return UserModel.fromJson({});
        // return null;
      }
      throw res.statusCode;
    } catch (e) {
      rethrow;
    }
  }
}
