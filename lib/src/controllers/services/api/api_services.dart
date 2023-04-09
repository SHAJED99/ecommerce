import 'dart:convert';

import 'package:ecommerce/src/controllers/services/api/http_call.dart';
import 'package:ecommerce/src/models/pojo_classes/category_model.dart';
import 'package:ecommerce/src/models/pojo_classes/product_list_slider_model.dart';
import 'package:ecommerce/src/models/pojo_classes/product_model.dart';
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
}
