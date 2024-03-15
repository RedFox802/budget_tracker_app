import 'card_wrapper.dart';

class CardCircularTopBorderWrapper extends CardWrapper {
  const CardCircularTopBorderWrapper({
    required super.child,
    required super.padding,
    super.elevation,
    this.borderRadius = 16,
    super.color,
    super.key,
  }) : super(
          topLeftBorderRadius: borderRadius,
          topRightBorderRadius: borderRadius,
        );

  final double borderRadius;
}
