import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final double? height;
  final bool enabled;
  final Iterable<String>? autofillHints;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final TextStyle? errorStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final BorderRadius? borderRadius;
  final Function(String? value)? validator;
  final void Function(String? value)? onComplete;
  final void Function(String value)? onChanged;
  final void Function()? onTap;
  final TextEditingController? textEditingController;
  const CustomTextFormField({
    Key? key,
    this.height = 48,
    this.autofillHints,
    this.contentPadding,
    this.validator,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.hintText = "",
    this.textEditingController,
    this.onComplete,
    this.onChanged,
    this.borderRadius,
    this.onTap,
    this.enabled = true,
    this.style,
    this.errorStyle,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController textEditingController;
  late String hintText;
  late BorderRadius borderRadius;
  bool error = false;

  @override
  void initState() {
    super.initState();
    textEditingController = widget.textEditingController ?? TextEditingController();
    hintText = widget.hintText;
    borderRadius = widget.borderRadius ?? BorderRadius.circular(8);
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        enabled: widget.enabled,
        controller: textEditingController,
        autofillHints: widget.autofillHints,
        style: widget.style ?? TextStyle(color: Theme.of(context).primaryColor),
        onEditingComplete: () {
          if (widget.onComplete != null) widget.onComplete!(textEditingController.text);
        },
        onChanged: (value) {
          if (widget.onChanged != null) widget.onChanged!(value);
          if (error) {
            hintText = widget.hintText;
            error = false;
          }
          if (mounted) setState(() {});
        },
        onTap: () {
          if (widget.onTap != null) widget.onTap!();
          if (error) {
            hintText = widget.hintText;
            error = false;
          }
          if (mounted) setState(() {});
        },
        validator: (value) {
          if (widget.validator == null || widget.validator!(value) == null) return null;
          error = true;
          textEditingController.clear();
          hintText = widget.validator!(value);
          if (mounted) setState(() {});
          return "";
        },
        decoration: InputDecoration(
          hintText: hintText,
          errorStyle: widget.errorStyle ?? const TextStyle(height: 0),
          contentPadding: widget.contentPadding,
          enabledBorder: widget.enabledBorder ??
              OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
              ),
          focusedBorder: widget.focusedBorder ??
              OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColorDark),
              ),
          errorBorder: widget.errorBorder ??
              OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(width: 2, color: Theme.of(context).colorScheme.error),
              ),
          focusedErrorBorder: widget.focusedErrorBorder ??
              OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColorDark),
              ),
          disabledBorder: widget.disabledBorder ??
              OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColorLight),
              ),
        ),
      ),
    );
  }
}
