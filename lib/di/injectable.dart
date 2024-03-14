import 'package:injectable/injectable.dart';

import 'injectable.config.dart';
import 'service_locator.dart';

@InjectableInit()
Future configureDependencies() async {
  sl.init();
}
