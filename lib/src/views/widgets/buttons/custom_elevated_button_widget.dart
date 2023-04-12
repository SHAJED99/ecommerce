import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final double? height;
  final double? width;
  final BoxConstraints? constraints;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final Future<bool?>? Function()? onTap;
  final Function(bool? isSuccess)? onDone;
  final Widget? child;
  final Widget? onRunningWidget;
  final Widget? onSuccessWidget;
  final Widget? onErrorWidget;
  final bool expanded;
  final MainAxisAlignment mainAxisAlignment;
  final Duration statusShowingDuration;
  final Color? backgroundColor;
  final Color iconColor;
  const CustomElevatedButton({
    super.key,
    this.height = 48,
    this.width,
    this.constraints,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.onTap,
    this.child,
    this.onRunningWidget,
    this.expanded = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.onSuccessWidget,
    this.onErrorWidget,
    this.statusShowingDuration = const Duration(seconds: 2),
    this.onDone,
    this.backgroundColor,
    this.iconColor = Colors.white,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  ButtonStatus isRunning = ButtonStatus.stable;
  bool? result;

  Widget child() {
    // if (widget.onRunningWidget != null && isRunning == ButtonStatus.running) {
    if (isRunning == ButtonStatus.running) {
      return widget.onRunningWidget ??
          Expanded(child: Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: AspectRatio(aspectRatio: 1, child: CircularProgressIndicator(color: widget.iconColor))));
      // } else if (widget.onSuccessWidget != null && isRunning == ButtonStatus.success) {
    } else if (isRunning == ButtonStatus.success) {
      return widget.onSuccessWidget ??
          Expanded(child: Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: AspectRatio(aspectRatio: 1, child: FittedBox(child: Icon(Icons.done, color: widget.iconColor)))));
      // } else if (widget.onErrorWidget != null && isRunning == ButtonStatus.error) {
    } else if (isRunning == ButtonStatus.error) {
      return widget.onErrorWidget ??
          Expanded(child: Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: AspectRatio(aspectRatio: 1, child: FittedBox(child: Icon(Icons.error, color: widget.iconColor)))));
    } else {
      return widget.child ?? Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: widget.borderRadius),
      child: Material(
        color: widget.backgroundColor ?? Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () async {
            if (isRunning != ButtonStatus.stable) return;
            if (mounted) setState(() => isRunning = ButtonStatus.running);
            if (widget.onTap != null) {
              result = await widget.onTap!();
              if (result != null) {
                if (result! && mounted) setState(() => isRunning = ButtonStatus.success);
                if (!result! && mounted) setState(() => isRunning = ButtonStatus.error);
                await Future.delayed(widget.statusShowingDuration);
              }
            }
            if (widget.onDone != null) widget.onDone!(result);
            if (mounted) setState(() => isRunning = ButtonStatus.stable);
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
                child(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum ButtonStatus { stable, running, success, error }
