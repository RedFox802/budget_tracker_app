import 'card_wrapper.dart';

class CardCircularTopBorderWrapper extends CardWrapper {
  const CardCircularTopBorderWrapper({
    required super.child,
    required super.padding,
    super.elevation,
    super.color,
    super.borderColor,
    this.borderRadius = 16,
    super.key,
  }) : super(
          topLeftBorderRadius: borderRadius,
          topRightBorderRadius: borderRadius,
        );

  final double borderRadius;
}
