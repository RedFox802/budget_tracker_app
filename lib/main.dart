import 'package:budget_tracker_app/app/app_builder.dart';
import 'package:budget_tracker_app/di/injectable.dart';
import 'package:budget_tracker_app/router/app_router.dart';
import 'package:budget_tracker_app/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  configureDependencies();

  DateTimeUtils.initFormatLocale();

  final builder = AppBuilder(appRouter);
  runApp(builder.buildApp());
}
