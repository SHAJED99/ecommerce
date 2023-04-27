import 'package:ecommerce/src/models/app_models/app_constants.dart';
import 'package:ecommerce/src/views/widgets/buttons/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';

class CartQuantityCounter extends StatefulWidget {
  final int initialValue;
  final int? minimumRange;
  final int? maximumRange;
  final int changeValue;
  final Function(int value)? onChange;

  const CartQuantityCounter({
    super.key,
    this.initialValue = 1,
    this.minimumRange = 1,
    this.maximumRange,
    this.changeValue = 1,
    this.onChange,
  });

  @override
  State<CartQuantityCounter> createState() => _CartQuantityCounterState();
}

class _CartQuantityCounterState extends State<CartQuantityCounter> {
  late int currentValue;
  @override
  void initState() {
    currentValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Quantity remove
        CustomElevatedButton(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(widget.minimumRange != null && currentValue <= widget.minimumRange! ? 0.6 : 1),
          borderRadius: BorderRadius.circular(4),
          height: defaultPadding * 1.5,
          width: defaultPadding * 1.5,
          contentPadding: const EdgeInsets.symmetric(horizontal: 1),
          child: FittedBox(
              child: Icon(
            Icons.remove,
            color: Theme.of(context).canvasColor,
          )),
          onTap: () {
            if (widget.minimumRange != null && currentValue <= widget.minimumRange!) return;
            if (mounted) setState(() => currentValue = currentValue - widget.changeValue);
            if (widget.onChange != null) widget.onChange!(currentValue);
            return;
          },
        ),
        // Item Count
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Text(
            currentValue.toString().padLeft(2, '0'),
            style: defaultSubtitle1.copyWith(color: defaultBlackColor),
          ),
        ),
        // Quantity add
        CustomElevatedButton(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(widget.maximumRange != null && currentValue >= widget.maximumRange! ? 0.6 : 1),
          borderRadius: BorderRadius.circular(4),
          height: defaultPadding * 1.5,
          width: defaultPadding * 1.5,
          contentPadding: const EdgeInsets.symmetric(horizontal: 1),
          child: FittedBox(
              child: Icon(
            Icons.add,
            color: Theme.of(context).canvasColor,
          )),
          onTap: () {
            if (widget.maximumRange != null && currentValue >= widget.maximumRange!) return;
            if (mounted) setState(() => currentValue = currentValue + widget.changeValue);
            if (widget.onChange != null) widget.onChange!(currentValue);
            return;
          },
        ),
      ],
    );
  }
}
