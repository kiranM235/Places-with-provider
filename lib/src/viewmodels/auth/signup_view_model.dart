import 'package:places/src/core/base_view_model.dart';
import 'package:places/src/services/auth/auth_service.dart';

class SignupViewModel extends BaseViewModel {
  final AuthService loginService;

  SignupViewModel({required this.loginService});

  String get errorMessage => loginService.errorMessage;

  Future<bool> signup(
      String name, String phone, String email, String password) async {
    setBusy(true);
    final response = await loginService.signup(name, phone, email, password);
    setBusy(false);
    return response;
  }
}
