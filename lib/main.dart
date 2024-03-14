import 'package:budget_tracker_app/app/app_builder.dart';
import 'package:budget_tracker_app/di/injectable.dart';
import 'package:budget_tracker_app/router/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  final builder = AppBuilder(appRouter);
  runApp(builder.buildApp());
}
