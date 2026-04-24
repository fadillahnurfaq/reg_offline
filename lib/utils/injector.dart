import 'package:get_it/get_it.dart';
import 'package:register_offline/services/auth_service.dart';

import 'dio_service/http_service.dart';


final GetIt locator = GetIt.instance;
class Injector {
  Injector._();
  
  static void setUp() {
    locator.registerLazySingleton<AuthService>(() => AuthService(httpService: locator<HttpService>()));
    locator.registerLazySingleton<HttpService>(() => const HttpService());
  }
}