import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/router/app_router.dart';

class TransactionListRouter {
  static AutoRoute router = AutoRoute(
    path: 'transactionList/',
    page: TransactionsListNestedRouterRoute.page,
    children: [
      ..._routes,
    ],
  );

  static final List<AutoRoute> _routes = <AutoRoute>[
    AutoRoute(
      initial: true,
      page: TransitionsListRoute.page,
    ),
  ];
}
