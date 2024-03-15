import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class CardWrapper extends StatelessWidget {
  const CardWrapper({
    required this.child,
    this.padding = EdgeInsets.zero,
    this.topLeftBorderRadius,
    this.bottomLeftBorderRadius,
    this.bottomRightBorderRadius,
    this.topRightBorderRadius,
    this.color,
    this.borderColor,
    this.elevation = 1,
    Key? key,
  }) : super(key: key);

  final Color? color;

  final double? topLeftBorderRadius;

  final double? bottomLeftBorderRadius;

  final double? bottomRightBorderRadius;

  final double? topRightBorderRadius;

  final EdgeInsets padding;

  final double elevation;

  final Color? borderColor;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final border = _getBorder(
      borderColor: borderColor,
    );
    return Material(
      type: MaterialType.card,
      elevation: elevation,
      shadowColor: AppColors.dark.withOpacity(0.3),
      color: color ?? AppColors.backgroundSecondary,
      shape: border,
      borderRadius: border == null ? _getBorderRadius() : null,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }

  ShapeBorder? _getBorder({
    Color? borderColor,
  }) {
    if (borderColor != null) {
      return RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor,
          width: 2,
        ),
        borderRadius: _getBorderRadius(),
      );
    }
    return null;
  }

  BorderRadius _getBorderRadius() {
    return BorderRadius.only(
      topLeft: _getRadius(topLeftBorderRadius),
      topRight: _getRadius(topRightBorderRadius),
      bottomRight: _getRadius(bottomRightBorderRadius),
      bottomLeft: _getRadius(bottomLeftBorderRadius),
    );
  }

  Radius _getRadius(double? radiusValue) {
    if (radiusValue != null) {
      return Radius.circular(radiusValue);
    }
    return Radius.zero;
  }
}
