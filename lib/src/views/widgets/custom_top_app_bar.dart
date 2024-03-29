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
  final MainScreenWrapperController mainScreenWrapperController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
      color: Theme.of(context).canvasColor,
      child: Obx(
        () => Row(
          children: [
            SvgPicture.asset("lib/assets/svg/logo_nav.svg"),
            const Spacer(),

            // Button
            NavBarRoundedButton(
              onTap: () => mainScreenWrapperController.scaffoldKey.currentState?.openEndDrawer(),
              isActive: dataController.token.isNotEmpty,
              icon: Icons.person_outline_rounded,
              showBubble: !(dataController.user.value?.isValid() ?? false)
                  ? const Icon(
                      Icons.error,
                      color: defaultErrorColor,
                    )
                  : null,
            ),
            NavBarRoundedButton(
              icon: Icons.call_outlined,
              onTap: () {},
            ),
            const NavBarRoundedButton(
              icon: Icons.edit_notifications_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarRoundedButton extends StatelessWidget {
  final void Function()? onTap;
  final IconData? icon;
  final bool isActive;
  final Widget? showBubble;

  const NavBarRoundedButton({
    super.key,
    this.onTap,
    this.icon,
    this.isActive = false,
    this.showBubble,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: defaultPadding / 2),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            ClipOval(
              child: Container(
                color: isActive ? Theme.of(context).primaryColor.withOpacity(0.2) : defaultGreyColor.withOpacity(0.2),
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding / 1.5),
                    child: Icon(icon, color: defaultBlackColor),
                  ),
                ),
              ),
            ),
            if (showBubble != null)
              Positioned(
                right: 0,
                child: Container(
                  height: defaultPadding,
                  width: defaultPadding,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: FittedBox(child: Center(child: showBubble)),
                ),
              ),
            Positioned.fill(
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(100),
                  bottomLeft: const Radius.circular(100),
                  topRight: Radius.circular(showBubble == null ? 100 : 32),
                  bottomRight: const Radius.circular(100),
                ),
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTopAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool fillBackground;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  CustomTopAppBar2({
    super.key,
    required this.title,
    this.fillBackground = true,
    this.color,
    this.boxShadow,
  });

  @override
  Size get preferredSize => const Size.fromHeight(defaultNavBarHeight);

  final MainScreenWrapperController mainScreenWrapperController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: defaultNavBarHeight,
      decoration: fillBackground
          ? BoxDecoration(
              color: color ?? Theme.of(context).canvasColor,
              boxShadow: boxShadow ?? defaultBoxShadowDown,
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
