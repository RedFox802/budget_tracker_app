import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/app/app_root_screen.dart';
import 'package:budget_tracker_app/feature/analytic/presentation/analytic_router.dart';
import 'package:budget_tracker_app/feature/analytic/presentation/screen/analytic_screen.dart';
import 'package:budget_tracker_app/feature/home/presentation/home_router.dart';
import 'package:budget_tracker_app/feature/home/presentation/screen/home_screen.dart';
import 'package:budget_tracker_app/feature/profile/presentation/profile_router.dart';
import 'package:budget_tracker_app/feature/profile/presentation/screen/profile_screen.dart';
import 'package:budget_tracker_app/feature/transactions_list/presentation/screen/transitions_list_screen.dart';
import 'package:budget_tracker_app/feature/transactions_list/presentation/transaction_list_router.dart';
import 'package:budget_tracker_app/router/nested_route.dart';
import 'package:flutter/widgets.dart';

part 'app_router.gr.dart';

enum AppRouterTabs {
  home,
  transactionsList,
  analytic,
  profile,
}

final appRouter = AppRouter();

@AutoRouterConfig(
  replaceInRouteName: 'Modal|Screen|Dialog,Route',
)
class AppRouter extends _$AppRouter {
  AppRouter() : super();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RootRoute.page,
          initial: true,
          path: '/',
          children: [
            HomeRouter.router,
            TransactionListRouter.router,
            AnalyticRouter.router,
            ProfileRouter.router,
          ],
        ),
      ];
}

extension AppRouterTabActions on AppRouter {
  void openTab(BuildContext context, AppRouterTabs tab) {
    AutoTabsRouter.of(context).setActiveIndex(tab.index);
  }
}
