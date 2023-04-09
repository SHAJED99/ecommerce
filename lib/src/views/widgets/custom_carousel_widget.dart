import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/models/pojo_classes/product_list_slider_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({
    super.key,
    required this.productList,
    required this.onBuild,
    this.decoration,
    this.margin = const EdgeInsets.only(left: defaultPadding / 4, right: defaultPadding / 4, bottom: defaultPadding / 4),
    this.clipBehavior = Clip.antiAlias,
    this.dotBorder,
  });
  final List<ProductListSliderModel> productList;
  final Widget Function(MapEntry<int, ProductListSliderModel> element) onBuild;
  final Decoration? decoration;
  final EdgeInsetsGeometry? margin;
  final Clip clipBehavior;
  final BoxBorder? dotBorder;

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final CarouselController carouselController = CarouselController();

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: widget.clipBehavior,
          margin: widget.margin,
          decoration: widget.decoration ?? BoxDecoration(borderRadius: BorderRadius.circular(defaultPadding / 2)),
          child: Stack(
            children: [
              CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  initialPage: _index,
                  height: defaultCarouselHeight,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: defaultDuration * 3),
                  onPageChanged: (index, reason) => {if (mounted) setState(() => _index = index)},
                ),
                items: widget.productList.asMap().entries.map((e) => widget.onBuild(e)).toList(),
              ),
            ],
          ),
        ),
        Wrap(
          children: widget.productList.asMap().entries.map((e) {
            return Container(
              margin: const EdgeInsets.only(bottom: defaultPadding, left: defaultPadding / 8, right: defaultPadding / 8),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: widget.dotBorder ??
                      Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 0.5,
                      )),
              child: ClipOval(
                child: Material(
                  color: e.key == _index.toInt() ? Theme.of(context).primaryColor : Theme.of(context).canvasColor,
                  child: InkWell(
                    onTap: () => carouselController.animateToPage(e.key),
                    child: const SizedBox(
                      width: defaultPadding / 1.5,
                      height: defaultPadding / 1.5,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
