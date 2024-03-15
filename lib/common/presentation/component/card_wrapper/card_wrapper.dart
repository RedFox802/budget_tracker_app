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
    this.elevation = 0.0,
    Key? key,
  }) : super(key: key);

  final Color? color;

  final double? topLeftBorderRadius;

  final double? bottomLeftBorderRadius;

  final double? bottomRightBorderRadius;

  final double? topRightBorderRadius;

  final EdgeInsets padding;

  final double elevation;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      elevation: elevation,
      color: color ?? Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: _getRadius(topLeftBorderRadius),
        topRight: _getRadius(topRightBorderRadius),
        bottomRight: _getRadius(bottomRightBorderRadius),
        bottomLeft: _getRadius(bottomLeftBorderRadius),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }

  Radius _getRadius(double? radiusValue) {
    if (radiusValue != null) {
      return Radius.circular(radiusValue);
    }
    return Radius.zero;
  }
}
