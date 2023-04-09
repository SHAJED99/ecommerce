import 'package:ecommerce/src/controllers/screen_controllers/wrapper_screen_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/models/pojo_classes/page_index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});
  final MainScreenWrapperController mainScreenWrapperController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: defaultNavBarHeight,
      decoration: const BoxDecoration(boxShadow: defaultBoxShadowUp),
      child: Material(
        child: Row(
          children: mainScreenWrapperController.pages
              .asMap()
              .entries
              .map(
                (e) => Expanded(
                  child: InkWell(
                    onTap: () {
                      mainScreenWrapperController.changeIndex(index: PageEnum.values.elementAt(e.key));
                    },
                    child: LayoutBuilder(builder: (context, boxConstraints) {
                      return Obx(
                        () => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon
                            SizedBox(
                              height: boxConstraints.maxHeight * 0.5,
                              child: FittedBox(
                                child: Icon(
                                  e.value.iconData,
                                  color: e.key == mainScreenWrapperController.currentPage.value.pageIndex.index ? Theme.of(context).primaryColor : defaultGreyColor,
                                ),
                              ),
                            ),
                            // Name
                            Text(
                              e.value.name,
                              style: defaultSubtitle1.copyWith(
                                fontWeight: e.key == mainScreenWrapperController.currentPage.value.pageIndex.index ? FontWeight.bold : FontWeight.normal,
                                height: 1,
                                color: e.key == mainScreenWrapperController.currentPage.value.pageIndex.index ? Theme.of(context).primaryColor : defaultGreyColor,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
