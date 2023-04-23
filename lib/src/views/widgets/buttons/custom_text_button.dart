import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final BorderRadius borderRadius;
  final Color? backgroundColor;
  final bool expanded;
  final EdgeInsetsGeometry? contentPadding;
  final double? height;
  final double? width;
  final BoxConstraints? constraints;
  final MainAxisAlignment mainAxisAlignment;
  final Widget? child;
  final bool enable;
  final Function()? onTap;

  const CustomTextButton({
    super.key,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.backgroundColor,
    this.expanded = false,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.height,
    this.width,
    this.constraints,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.child,
    this.onTap,
    this.enable = true,
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: widget.borderRadius),
      child: Material(
        color: widget.backgroundColor ?? Colors.transparent,
        child: InkWell(
          onTap: () {
            if (widget.enable && widget.onTap != null) widget.onTap!();
          },
          child: Container(
            alignment: widget.expanded ? Alignment.center : null,
            padding: widget.contentPadding,
            height: widget.height,
            width: widget.width,
            constraints: widget.constraints,
            child: Column(
              mainAxisAlignment: widget.mainAxisAlignment,
              children: [
                widget.child ?? Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
