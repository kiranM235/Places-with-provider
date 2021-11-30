import 'package:places/src/api/auth_api.dart';
import 'package:places/src/core/constants/app_constants.dart';
import 'package:places/src/core/locator/service_locator.dart';
import 'package:places/src/model/network_response_model.dart';
import 'package:places/src/model/user_model.dart';
import 'package:places/src/services/local/cache_provider.dart';
import 'package:places/src/services/local/db_provider.dart';

import '../rx_data_service.dart';

class SignupService {
  final AuthApi authApi = locator<AuthApi>();

  final DbProvider dbProvider = locator<DbProvider>();
  final CacheProvider cacheProvider = locator<CacheProvider>();
  final RxDataService rxDataService = locator<RxDataService>();

  Future<NetworkResponseModel> signup(String name, dynamic phone, String email, String password) async {
    final NetworkResponseModel response = await authApi.register(name, phone, email, password);
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
      rxDataService.addUser(user);
      cacheProvider.setStringValue(TOKEN_KEY, token);
      return NetworkResponseModel(status: true);
    }
    return response;
  }
}