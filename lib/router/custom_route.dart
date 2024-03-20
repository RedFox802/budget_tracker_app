import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

abstract class CustomRoutes {
  static Route<T> modalBottomSheetBuilder<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return ModalBottomSheetRoute(
      settings: page,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => child,
    );
  }
}
