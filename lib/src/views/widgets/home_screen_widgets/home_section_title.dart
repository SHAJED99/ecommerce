import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:flutter/material.dart';

class HomeSectionTitle extends StatelessWidget {
  final String categoriesName;
  final Function() onTap;
  final Widget? child;
  const HomeSectionTitle({super.key, required this.categoriesName, required this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: Row(
        children: [
          const SizedBox(width: defaultPadding / 2),
          Text(
            categoriesName,
            style: defaultCarouselTitle.copyWith(color: defaultBlackColor, height: 1),
          ),
          const Spacer(),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(defaultPadding / 2)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4, vertical: defaultPadding / 2),
                  child: Text("See All", style: TextStyle(height: 1, color: Theme.of(context).primaryColor)),
                ),
              ),
            ),
          ),
          const SizedBox(width: defaultPadding / 4),
        ],
      ),
    );
  }
}
