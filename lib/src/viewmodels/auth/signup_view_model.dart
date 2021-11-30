import 'package:places/src/core/locator/service_locator.dart';
import 'package:places/src/model/network_response_model.dart';
import 'package:places/src/services/auth/login_service.dart';
import 'package:places/src/services/auth/signup_service.dart';
import 'package:places/src/viewmodels/base_view_model.dart';

class SignupViewModel extends BaseViewModel {
  final SignupService service = locator<SignupService>();

  Future<NetworkResponseModel> signup(String name, String phone, String email, String password) {
    setBusy(true);
    final res = service.signup(name, phone, email, password);
    setBusy(false);
    return res;
  }
}