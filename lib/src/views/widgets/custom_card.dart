import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(defaultPadding / 2), boxShadow: defaultBoxShadowDown, color: Theme.of(context).canvasColor),
    );
  }
}
