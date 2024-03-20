import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/router/app_router.dart';
import 'package:budget_tracker_app/router/custom_route.dart';

class EditLimitRouter {
  static AutoRoute router = CustomRoute(
    path: 'editLimits/',
    page: EditLimitsNestedRouterRoute.page,
    transitionsBuilder: TransitionsBuilders.fadeIn,
    durationInMilliseconds: 300,
    children: [
      ..._routes,
    ],
  );

  static final List<AutoRoute> _routes = <AutoRoute>[
    CustomRoute(
      initial: true,
      page: EditLimitsRoute.page,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),
    AutoRoute(
      path: 'editModal',
      page: EditLimitRoute.page,
      type: const RouteType.custom(
        customRouteBuilder: CustomRoutes.modalBottomSheetBuilder,
      ),
    ),
  ];
}
