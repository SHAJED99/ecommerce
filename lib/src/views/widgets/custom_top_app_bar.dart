import 'package:ecommerce/src/controllers/data_controllers/data_controller.dart';
import 'package:ecommerce/src/controllers/screen_controllers/wrapper_screen_controller.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomTopAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(defaultNavBarHeight);

  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
      color: Theme.of(context).canvasColor,
      child: GetBuilder<DataController>(builder: (_) {
        return Row(
          children: [
            SvgPicture.asset("lib/assets/svg/logo_nav.svg"),
            const Spacer(),

            // Button
            NavBarRoundedButton(
              isActive: dataController.token.isNotEmpty,
              icon: Icons.person_outline_rounded,
            ),
            const NavBarRoundedButton(
              icon: Icons.call_outlined,
            ),
            const NavBarRoundedButton(
              icon: Icons.edit_notifications_outlined,
            ),
          ],
        );
      }),
    );
  }
}

class NavBarRoundedButton extends StatelessWidget {
  final void Function()? onTap;
  final IconData? icon;
  final bool isActive;
  const NavBarRoundedButton({
    super.key,
    this.onTap,
    this.icon,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: defaultPadding / 2),
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipOval(
          child: Material(
            color: isActive ? Theme.of(context).primaryColor.withOpacity(0.2) : defaultGreyColor.withOpacity(0.2),
            child: InkWell(
              onTap: onTap,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding / 1.5),
                  child: Icon(icon, color: defaultBlackColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTopAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool fillBackground;
  CustomTopAppBar2({super.key, required this.title, this.fillBackground = true});

  @override
  Size get preferredSize => const Size.fromHeight(defaultNavBarHeight);

  final MainScreenWrapperController mainScreenWrapperController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: defaultNavBarHeight,
      decoration: fillBackground
          ? BoxDecoration(
              color: Theme.of(context).canvasColor,
              boxShadow: defaultBoxShadowDown,
            )
          : null,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => mainScreenWrapperController.goBackPage(),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(defaultPadding),
                color: Colors.transparent,
                child: const FittedBox(
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
          Text(
            title,
            style: buttonText1.copyWith(color: defaultBlackColor),
          )
        ],
      ),
    );
  }
}
