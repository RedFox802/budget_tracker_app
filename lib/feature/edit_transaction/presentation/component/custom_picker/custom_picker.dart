import 'package:flutter/cupertino.dart';

class CustomPicker extends StatelessWidget {
  const CustomPicker({
    required this.onSelectedItemChanged,
    required this.items,
    super.key,
  });

  final ValueChanged<int> onSelectedItemChanged;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 166,
      child: CupertinoPicker(
        itemExtent: 34,
        squeeze: 1.2,
        selectionOverlay: Container(
          decoration: BoxDecoration(
            color: CupertinoColors.tertiarySystemFill,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onSelectedItemChanged: onSelectedItemChanged,
        children: items,
      ),
    );
  }
}
