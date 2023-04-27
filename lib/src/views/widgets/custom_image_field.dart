import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.image,
    this.width,
    this.height,
  });

  final String image;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      errorBuilder: (context, error, stackTrace) => SizedBox(
        width: width,
        height: height,
        child: FittedBox(child: Icon(Icons.no_photography, color: Theme.of(context).cardColor)),
      ),
    );
  }
}
