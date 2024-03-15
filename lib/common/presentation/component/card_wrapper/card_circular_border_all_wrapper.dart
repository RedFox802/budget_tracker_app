import 'card_wrapper.dart';

class CardCircularBorderAllWrapper extends CardWrapper {
  const CardCircularBorderAllWrapper({
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
          bottomLeftBorderRadius: borderRadius,
          bottomRightBorderRadius: borderRadius,
        );

  final double borderRadius;
}
