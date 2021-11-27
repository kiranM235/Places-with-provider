import 'package:get_it/get_it.dart';
import 'package:places/src/api/auth_api.dart';
import 'package:places/src/services/auth/login_service.dart';
import 'package:places/src/services/local/cache_provider.dart';
import 'package:places/src/services/local/db_provider.dart';
import 'package:places/src/services/splash/splash_service.dart';
import 'package:places/src/viewmodels/auth/login_view_model.dart';
import 'package:places/src/viewmodels/splash/splash_view_model.dart';

GetIt locator = GetIt.instance();
void setupLocator() {
  /// independent services
  locator.registerLazySingleton<AuthApi>(() => AuthApi());
  locator.registerLazySingleton<DbProvider>(() => DbProvider());
  locator.registerLazySingleton<CacheProvider>(() => CacheProvider());

  /// dependent services
  locator.registerLazySingleton<LoginService>(() => LoginService());
  locator.registerLazySingleton<SplashService>(() => SplashService());

  /// view models
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<SplashViewModel>(() => SplashViewModel());
}