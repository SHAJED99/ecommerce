import 'package:ecommerce/src/models/pojo_classes/page_index.dart';
import 'package:flutter/material.dart';

class ScreenState {
  final PageEnum pageIndex;
  final PreferredSizeWidget topBarIndex;
  final Widget page;

  ScreenState({required this.page, required this.pageIndex, required this.topBarIndex});
}
