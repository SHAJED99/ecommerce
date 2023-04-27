import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';

class ColorSelection extends StatefulWidget {
  final List<String> colors;
  final int initialItem;
  final Function(String colorHex)? onChange;
  const ColorSelection({
    super.key,
    required this.colors,
    this.onChange,
    this.initialItem = 0,
  });

  @override
  State<ColorSelection> createState() => _ColorSelectionState();
}

class _ColorSelectionState extends State<ColorSelection> {
  late int currentItem;
  @override
  void initState() {
    currentItem = widget.initialItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.colors
          .asMap()
          .entries
          .map((e) => CustomElevatedButton(
                margin: const EdgeInsets.only(right: defaultPadding / 2, top: defaultPadding / 2, bottom: defaultPadding / 2),
                height: defaultPadding * 1.5,
                width: defaultPadding * 1.5,
                borderRadius: BorderRadius.circular(100),
                contentPadding: const EdgeInsets.all(defaultPadding / 4),
                backgroundColor: Color(int.parse(e.value.substring(1, 7), radix: 16) + 0xFF000000),
                onTap: () {
                  if (mounted) setState(() => currentItem = e.key);
                  if (widget.onChange != null) widget.onChange!(e.value);
                  return;
                },
                child: currentItem == e.key
                    ? FittedBox(
                        child: Icon(
                          Icons.done_rounded,
                          color: Theme.of(context).canvasColor,
                        ),
                      )
                    : null,
              ))
          .toList(),
    );
  }
}
