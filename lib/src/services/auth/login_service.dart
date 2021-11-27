import 'package:places/src/api/auth_api.dart';
import 'package:places/src/core/constants/app_constants.dart';
import 'package:places/src/core/locator/service_locator.dart';
import 'package:places/src/model/network_response_model.dart';
import 'package:places/src/model/user_model.dart';
import 'package:places/src/services/local/cache_provider.dart';
import 'package:places/src/services/local/db_provider.dart';

class LoginService {
  final AuthApi authApi = locator<AuthApi>();

  final DbProvider dbProvider = locator<DbProvider>();
  final CacheProvider cacheProvider = locator<CacheProvider>();

  Future<NetworkResponseModel> login(String email, String password) async {
    final NetworkResponseModel response = await authApi.login(email, password);
    if(response.status) {
      String token = response.data;
      ///1. todo use the token to retrieve the user detail and save it on the local database
      /// 2.todo set already logged in as true
      /// 3. todo store the token in cache
      final NetworkResponseModel profileResponse = await authApi.fetchUserDetail(token);
      if(!profileResponse.status){
        return profileResponse;
      }
      UserModel user = profileResponse.data;
      await dbProvider.insertUser(user);
      ///1
      cacheProvider.setStringValue(TOKEN_KEY, token);
      ///2
      cacheProvider.setBoolValue(IS_LOGGED_IN, true);
      return NetworkResponseModel(status: true);
    }
    return response;
  }
}