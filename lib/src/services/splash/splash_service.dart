import 'package:places/src/core/constants/app_constants.dart';
import 'package:places/src/core/locator/service_locator.dart';
import 'package:places/src/model/user_model.dart';
import 'package:places/src/services/local/cache_provider.dart';
import 'package:places/src/services/local/db_provider.dart';

class SplashService {
  final DbProvider dbProvider = locator<DbProvider>();
  final CacheProvider cacheProvider = locator<CacheProvider>();


  bool isAlreadyLoggedIn = false;

  Future void initialize() async {
    ///todo 1. load up the user from database if exists
    UserModel? user = await dbProvider.getUser();
    if(user == null) {
      return;
    }
    ///todo 2. load up the user from cache if exists
    String? token = await cacheProvider.getStringValue(TOKEN_KEY);
    if(token == null){
      return;
    }
    ///todo 3. decide whether the user is already logged in or not
    isAlreadyLoggedIn = true;
  }
}