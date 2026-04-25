import 'package:get_it/get_it.dart';
import 'package:register_offline/services/auth_service.dart';
import 'package:register_offline/services/member_local_service.dart';
import 'package:register_offline/services/member_service.dart';
import 'package:register_offline/utils/main_route_observer.dart';

import 'dio_service/http_service.dart';


final GetIt locator = GetIt.instance;
class Injector {
  Injector._();
  
  static void setUp() {
    locator.registerLazySingleton<AuthService>(() => AuthService(httpService: locator<HttpService>()));
    locator.registerLazySingleton<MemberService>(() => MemberService(httpService: locator<HttpService>()));
    locator.registerLazySingleton<MemberLocalService>(() => MemberLocalService());

    locator.registerLazySingleton<HttpService>(() => const HttpService());
    
    locator.registerSingleton<MainRouteObserver>(MainRouteObserver());
  }
}