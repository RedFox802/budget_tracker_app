import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    required this.hint,
    required this.readOnly,
    this.onTap,
    this.onChanged,
    this.onClear,
    this.onFieldSubmitted,
    Key? key,
  }) : super(key: key);

  final ValueChanged<String?>? onChanged;

  final ValueChanged<String?>? onFieldSubmitted;

  final VoidCallback? onClear;

  final String hint;

  final bool readOnly;

  final VoidCallback? onTap;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  InputBorder get _inputBorder => InputBorder.none;

  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: TextFormField(
        controller: _textController,
        onTap: widget.onTap,
        onFieldSubmitted: widget.onFieldSubmitted,
        onChanged: widget.onChanged,
        readOnly: widget.readOnly,
        style: AppTextTheme.regular,
        cursorColor: AppColors.primary40,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.disabled.withOpacity(0.15),
          hintText: widget.hint,
          hintStyle: AppTextTheme.regularDisabled,
          enabledBorder: _inputBorder,
          border: _inputBorder,
          focusedErrorBorder: _inputBorder,
          focusedBorder: _inputBorder,
          disabledBorder: _inputBorder,
          errorBorder: _inputBorder,
          contentPadding: const EdgeInsets.only(left: 16, bottom: 8, top: 10),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ValueListenableBuilder(
              valueListenable: _textController,
              builder: (context, value, child) {
                if (value.text.isNotEmpty && child != null) {
                  return child;
                }
                return const Icon(
                  Icons.search,
                  color: AppColors.disabled,
                );
              },
              child: IconButton(
                padding: EdgeInsets.zero,
                visualDensity: const VisualDensity(
                  vertical: -4,
                  horizontal: -4,
                ),
                icon: const Icon(
                  Icons.clear,
                  color: AppColors.primary100,
                ),
                onPressed: () {
                  _textController.clear();
                  widget.onClear?.call();
                },
              ),
            ),
          ),
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 24,
          ),
        ),
      ),
    );
  }
}
