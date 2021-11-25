import 'package:places/src/api/auth_api.dart';
import 'package:places/src/core/locator/service_locator.dart';
import 'package:places/src/model/network_response_model.dart';
import 'package:places/src/services/local/cache_provider.dart';
import 'package:places/src/services/local/db_provider.dart';

class LoginService {
  final AuthApi authApi = locator<AuthApi>();

  final DbProvider dbProvider = locator<DbProvider>();
  final CacheProvider cacheProvider = locator<CacheProvider>();

  Future<void> login(String email, String password) async {
    final NetworkResponseModel response = await authApi.login(email, password);
    if(response.status) {
      String token = response.data;
      /// todo use the token to retrieve the user detail and save it on the local database
      /// todo set already logged in as true
    }
  }
}