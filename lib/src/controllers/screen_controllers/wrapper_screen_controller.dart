import 'package:ecommerce/src/models/pojo_classes/custom_page_model.dart';
import 'package:ecommerce/src/models/pojo_classes/page_index.dart';
import 'package:ecommerce/src/models/pojo_classes/wrapped_screen_state.dart';
import 'package:ecommerce/src/views/screens/main_screen/cart_screen.dart';
import 'package:ecommerce/src/views/screens/main_screen/categories_screen.dart';
import 'package:ecommerce/src/views/screens/main_screen/home_screen.dart';
import 'package:ecommerce/src/views/screens/main_screen/wish_screen.dart';
import 'package:ecommerce/src/views/widgets/custom_top_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenWrapperController extends GetxController {
  final RxList<ScreenState> _previousPages = RxList<ScreenState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late Rx<ScreenState> currentPage = ScreenState(pageIndex: PageEnum.home, topBarIndex: CustomTopAppBar(), page: HomeScreen()).obs;

  List<CustomPage> pages = [
    CustomPage(name: "Home", iconData: Icons.home_outlined, page: HomeScreen()),
    CustomPage(name: "Categories", iconData: Icons.category_outlined, page: CategoriesScreen()),
    CustomPage(name: "Cart", iconData: Icons.shopping_bag_outlined, page: CartScreen()),
    CustomPage(name: "Wish", iconData: Icons.card_giftcard, page: WishScreen()),
  ];

  void changeIndex({required PageEnum index, PreferredSizeWidget? topNavBar, Widget? page}) {
    // Add previous page list
    _previousPages.add(currentPage.value);

    // Reset page list
    if (page == null) {
      _previousPages.value = [];
    }

    // Set current page
    currentPage.value = ScreenState(pageIndex: index, topBarIndex: page == null ? CustomTopAppBar() : topNavBar ?? currentPage.value.topBarIndex, page: page ?? pages[index.index].page);

    if (kDebugMode) print("MainScreenWrapperController.goBackPage(): Current Page: ${currentPage.value.pageIndex},  Previous Page Length: ${_previousPages.length}");
  }

  bool goBackPage() {
    // Close endDrawer
    if (scaffoldKey.currentState?.isEndDrawerOpen ?? false) {
      scaffoldKey.currentState?.closeEndDrawer();
      return false;
    }

    // Exit app
    if (currentPage.value.pageIndex == PageEnum.home && _previousPages.isEmpty) {
      return true;
    }

    // Go to home page / Reset page
    if (currentPage.value.pageIndex != PageEnum.home && _previousPages.isEmpty) {
      currentPage.value = ScreenState(pageIndex: PageEnum.home, topBarIndex: CustomTopAppBar(), page: HomeScreen());
      return false;
    }

    currentPage.value = _previousPages.last;
    _previousPages.removeLast();
    return false;
  }
}
