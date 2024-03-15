import 'card_wrapper.dart';

class CardCircularBottomBorderWrapper extends CardWrapper {
  const CardCircularBottomBorderWrapper({
    required super.child,
    required super.padding,
    super.elevation,
    this.borderRadius = 16,
    super.color,
    super.key,
  }) : super(
          bottomLeftBorderRadius: borderRadius,
          bottomRightBorderRadius: borderRadius,
        );

  final double borderRadius;
}
