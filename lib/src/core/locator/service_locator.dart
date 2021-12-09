import 'package:get_it/get_it.dart';
import 'package:places/src/api/auth_api.dart';
import 'package:places/src/api/dashboard/explore_api.dart';
import 'package:places/src/services/auth/login_service.dart';
import 'package:places/src/services/auth/signup_service.dart';
import 'package:places/src/services/dashboard/explore_service.dart';
import 'package:places/src/services/local/cache_provider.dart';
import 'package:places/src/services/local/db_provider.dart';
import 'package:places/src/services/rx_data_service.dart';
import 'package:places/src/services/splash/navigation_service.dart';
import 'package:places/src/services/splash/splash_service.dart';
import 'package:places/src/viewmodels/auth/login_view_model.dart';
import 'package:places/src/viewmodels/auth/signup_view_model.dart';
import 'package:places/src/viewmodels/dashboard/add_new_place_view_model.dart';
import 'package:places/src/viewmodels/dashboard/explore_view_model.dart';
import 'package:places/src/viewmodels/splash/splash_view_model.dart';
import 'package:places/src/viewmodels/dashboard/dashboard_view_model.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  /// independent services
  locator.registerLazySingleton<AuthApi>(() => AuthApi());
  locator.registerLazySingleton<ExploreApi>(() => ExploreApi());
  locator.registerLazySingleton<DbProvider>(() => DbProvider());
  locator.registerLazySingleton<CacheProvider>(() => CacheProvider());
  locator.registerLazySingleton<RxDataService>(() => RxDataService());
  locator.registerLazySingleton<NavigationService>(() => NavigationService());

  /// dependent services
  locator.registerLazySingleton<LoginService>(() => LoginService());
  locator.registerLazySingleton<SplashService>(() => SplashService());
  locator.registerLazySingleton<ExploreService>(() => ExploreService());
  locator.registerLazySingleton<SignupService>(() => SignupService());

  /// view models
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<SplashViewModel>(() => SplashViewModel());
  locator.registerFactory<ExploreViewModel>(() => ExploreViewModel());
  locator.registerFactory<DashboardViewModel>(() => DashboardViewModel());
  locator.registerFactory<AddNewPlaceViewModel>(() => AddNewPlaceViewModel());
  locator.registerFactory<SignupViewModel>(() => SignupViewModel());
}