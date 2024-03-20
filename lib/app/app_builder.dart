import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/common/domain/transition_list/cubit/transactions_list_cubit.dart';
import 'package:budget_tracker_app/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

class AppBuilder {
  AppBuilder(this.appRouter);

  final RootStackRouter appRouter;

  List<SingleChildWidget> get providers => [
        BlocProvider.value(
          value: getIt<TransactionsListCubit>()..init(),
        ),
      ];

  Widget buildApp() {
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        title: 'Budget tracker app',
        debugShowCheckedModeBanner: false,
        routeInformationProvider: appRouter.routeInfoProvider(),
        routeInformationParser: appRouter.defaultRouteParser(),
        themeMode: ThemeMode.light,
        routerDelegate: AutoRouterDelegate(
          appRouter,
          navigatorObservers: () => [AutoRouteObserver()],
        ),
        // theme: getIt<AppThemeData>().themeData,
      ),
    );
  }
}
