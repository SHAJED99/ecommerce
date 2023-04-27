import 'package:ecommerce/src/controllers/services/functions/size_conversion.dart';
import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';

class SizeSelection extends StatefulWidget {
  final List<String> sizes;
  final int initialItem;
  final Function(String sizeString)? onChange;
  const SizeSelection({
    super.key,
    required this.sizes,
    this.onChange,
    this.initialItem = 0,
  });

  @override
  State<SizeSelection> createState() => _SizeSelectionState();
}

class _SizeSelectionState extends State<SizeSelection> {
  late int currentItem;
  @override
  void initState() {
    currentItem = widget.initialItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.sizes
          .asMap()
          .entries
          .map((e) => CustomElevatedButton(
                border: Border.all(color: e.key == currentItem ? Theme.of(context).primaryColor : defaultBlackColor, width: 1, strokeAlign: BorderSide.strokeAlignOutside),
                margin: const EdgeInsets.only(right: defaultPadding / 2, top: defaultPadding / 2, bottom: defaultPadding / 2),
                height: defaultPadding * 1.5,
                width: defaultPadding * 1.5,
                borderRadius: BorderRadius.circular(100),
                contentPadding: const EdgeInsets.all(defaultPadding / 4),
                backgroundColor: e.key == currentItem ? Theme.of(context).primaryColor : Colors.transparent,
                onTap: () {
                  if (mounted) setState(() => currentItem = e.key);
                  if (widget.onChange != null) widget.onChange!(e.value);
                  return;
                },
                child: Text(
                  sizeConversion(e.value),
                  style: defaultSubtitle1.copyWith(height: 1, color: e.key == currentItem ? defaultWhiteColor : defaultBlackColor),
                ),
              ))
          .toList(),
    );
  }
}
