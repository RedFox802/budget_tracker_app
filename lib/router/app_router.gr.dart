// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AnalyticNestedRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AnalyticNestedRouterScreen(),
      );
    },
    AnalyticRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AnalyticScreen(),
      );
    },
    EditLimitRoute.name: (routeData) {
      final args = routeData.argsAs<EditLimitRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditLimitModal(
          category: args.category,
          key: args.key,
        ),
      );
    },
    EditLimitsNestedRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditLimitsNestedRouterScreen(),
      );
    },
    EditLimitsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditLimitsScreen(),
      );
    },
    EditTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<EditTransactionRouteArgs>(
          orElse: () => const EditTransactionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditTransactionScreen(
          key: args.key,
          transactionEntity: args.transactionEntity,
        ),
      );
    },
    FilterSelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FilterSelectionScreen(),
      );
    },
    HomeNestedRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeNestedRouterScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootScreen(),
      );
    },
    SearchTransactionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchTransactionsScreen(),
      );
    },
    TransactionsListNestedRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TransactionsListNestedRouterScreen(),
      );
    },
    TransitionsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TransitionsListScreen(),
      );
    },
  };
}

/// generated route for
/// [AnalyticNestedRouterScreen]
class AnalyticNestedRouterRoute extends PageRouteInfo<void> {
  const AnalyticNestedRouterRoute({List<PageRouteInfo>? children})
      : super(
          AnalyticNestedRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnalyticNestedRouterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AnalyticScreen]
class AnalyticRoute extends PageRouteInfo<void> {
  const AnalyticRoute({List<PageRouteInfo>? children})
      : super(
          AnalyticRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnalyticRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditLimitModal]
class EditLimitRoute extends PageRouteInfo<EditLimitRouteArgs> {
  EditLimitRoute({
    required TransactionExpenditureCategory category,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditLimitRoute.name,
          args: EditLimitRouteArgs(
            category: category,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditLimitRoute';

  static const PageInfo<EditLimitRouteArgs> page =
      PageInfo<EditLimitRouteArgs>(name);
}

class EditLimitRouteArgs {
  const EditLimitRouteArgs({
    required this.category,
    this.key,
  });

  final TransactionExpenditureCategory category;

  final Key? key;

  @override
  String toString() {
    return 'EditLimitRouteArgs{category: $category, key: $key}';
  }
}

/// generated route for
/// [EditLimitsNestedRouterScreen]
class EditLimitsNestedRouterRoute extends PageRouteInfo<void> {
  const EditLimitsNestedRouterRoute({List<PageRouteInfo>? children})
      : super(
          EditLimitsNestedRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditLimitsNestedRouterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditLimitsScreen]
class EditLimitsRoute extends PageRouteInfo<void> {
  const EditLimitsRoute({List<PageRouteInfo>? children})
      : super(
          EditLimitsRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditLimitsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditTransactionScreen]
class EditTransactionRoute extends PageRouteInfo<EditTransactionRouteArgs> {
  EditTransactionRoute({
    Key? key,
    TransactionEntity? transactionEntity,
    List<PageRouteInfo>? children,
  }) : super(
          EditTransactionRoute.name,
          args: EditTransactionRouteArgs(
            key: key,
            transactionEntity: transactionEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'EditTransactionRoute';

  static const PageInfo<EditTransactionRouteArgs> page =
      PageInfo<EditTransactionRouteArgs>(name);
}

class EditTransactionRouteArgs {
  const EditTransactionRouteArgs({
    this.key,
    this.transactionEntity,
  });

  final Key? key;

  final TransactionEntity? transactionEntity;

  @override
  String toString() {
    return 'EditTransactionRouteArgs{key: $key, transactionEntity: $transactionEntity}';
  }
}

/// generated route for
/// [FilterSelectionScreen]
class FilterSelectionRoute extends PageRouteInfo<void> {
  const FilterSelectionRoute({List<PageRouteInfo>? children})
      : super(
          FilterSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilterSelectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeNestedRouterScreen]
class HomeNestedRouterRoute extends PageRouteInfo<void> {
  const HomeNestedRouterRoute({List<PageRouteInfo>? children})
      : super(
          HomeNestedRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeNestedRouterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RootScreen]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchTransactionsScreen]
class SearchTransactionsRoute extends PageRouteInfo<void> {
  const SearchTransactionsRoute({List<PageRouteInfo>? children})
      : super(
          SearchTransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchTransactionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TransactionsListNestedRouterScreen]
class TransactionsListNestedRouterRoute extends PageRouteInfo<void> {
  const TransactionsListNestedRouterRoute({List<PageRouteInfo>? children})
      : super(
          TransactionsListNestedRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsListNestedRouterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TransitionsListScreen]
class TransitionsListRoute extends PageRouteInfo<void> {
  const TransitionsListRoute({List<PageRouteInfo>? children})
      : super(
          TransitionsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransitionsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
