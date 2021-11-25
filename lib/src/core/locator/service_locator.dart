import 'package:get_it/get_it.dart';
import 'package:places/src/api/auth_api.dart';
import 'package:places/src/services/auth/login_service.dart';
import 'package:places/src/services/local/cache_provider.dart';
import 'package:places/src/services/local/db_provider.dart';
import 'package:places/src/viewmodels/auth/login_view_model.dart';

GetIt locator = GetIt.instance();
void setupLocator() {
  /// independent services
  locator.registerSingleton<AuthApi>(AuthApi());
  locator.registerSingleton<DbProvider>(DbProvider());
  locator.registerSingleton<CacheProvider>(CacheProvider());

  /// dependent services
  locator.registerSingleton<LoginService>(LoginService());

  /// view models
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
}