import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/controllers/screen_controllers/wrapper_screen_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:ecommerce/src/views/widgets/custom_bottom_nav_bar.dart';
import 'package:ecommerce/src/views/widgets/end_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenWrapper extends StatelessWidget {
  MainScreenWrapper({super.key});
  final MainScreenWrapperController pageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool res = pageController.goBackPage();
        if (res) {
          showDialog(
            context: context,
            builder: (context) => Container(),
          );
        }
        return false;
      },
      child: Obx(
        () => Container(
          color: Theme.of(context).primaryColor,
          child: SafeArea(
            child: Scaffold(
              key: pageController.scaffoldKey,
              appBar: pageController.currentPage.value.topBarIndex,
              endDrawer: EndDrawer(),
              body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
                return Container(
                  alignment: Alignment.topCenter,
                  width: boxConstraints.maxWidth,
                  height: boxConstraints.maxHeight,
                  child: AnimatedSwitcher(
                    // switchInCurve: Curves.easeIn,
                    // switchOutCurve: Curves.easeInOut,
                    duration: const Duration(milliseconds: defaultDuration * 2),
                    child: pageController.currentPage.value.page,
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: Tween<double>(
                          begin: 0,
                          end: 1,
                        ).animate(animation),
                        child: child,
                      );
                      // return SlideTransition(
                      //   position: Tween<Offset>(
                      //     begin: const Offset(0, 1),
                      //     end: Offset.zero,
                      //   ).animate(animation),
                      //   child: child,
                      // );
                    },
                  ),
                );
              }),
              bottomNavigationBar: CustomBottomNavigationBar(),
            ),
          ),
        ),
      ),
    );
  }
}
