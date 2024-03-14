import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

class AppBuilder {
  AppBuilder(this.appRouter);

  List<SingleChildWidget> get providers => [];

  final RootStackRouter appRouter;

  Widget buildApp() {
    return MaterialApp.router(
      title: 'Budget tracker app',
      debugShowCheckedModeBanner: false,
      routeInformationProvider: appRouter.routeInfoProvider(),
      routeInformationParser: appRouter.defaultRouteParser(),
      themeMode: ThemeMode.light,
      locale: const Locale('ru'),
      routerDelegate: AutoRouterDelegate(
        appRouter,
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      // theme: getIt<AppThemeData>().themeData,
    );
  }
}
