import 'package:flutter/cupertino.dart';

class CustomPicker extends StatefulWidget {
  const CustomPicker({
    required this.onSelectedItemChanged,
    required this.items,
    this.initIndex = 0,
    super.key,
  });

  final ValueChanged<int> onSelectedItemChanged;

  final int initIndex;

  final List<Widget> items;

  @override
  State<CustomPicker> createState() => _CustomPickerState();
}

class _CustomPickerState extends State<CustomPicker> {
  late FixedExtentScrollController controller = FixedExtentScrollController(
    initialItem: widget.initIndex,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 166,
      child: CupertinoPicker(
        scrollController: controller,
        itemExtent: 34,
        squeeze: 1.2,
        selectionOverlay: Container(
          decoration: BoxDecoration(
            color: CupertinoColors.tertiarySystemFill,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onSelectedItemChanged: widget.onSelectedItemChanged,
        children: widget.items,
      ),
    );
  }
}
