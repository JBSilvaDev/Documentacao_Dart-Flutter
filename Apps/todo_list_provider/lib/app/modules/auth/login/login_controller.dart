import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/exeptions/auth_exeptions.dart';

import '../../../services/user/user_services.dart';


class LoginController extends DefaultChangeNotifier {
  final UserServices _userServices;
  String? infoMessage;

  LoginController({required UserServices userServices})
      : _userServices = userServices;

  bool get hasInfo => infoMessage != null;

  Future<void> googleLogin() async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      notifyListeners();
      final user = await _userServices.googleLogin();
      if (user != null) {
        success();
      } else {
        _userServices.logout();
        setError('Erro ou realizar login com Google');
      }
    } on AuthExceptions catch (e) {
      _userServices.logout();
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      notifyListeners();
      final user = await _userServices.login(email, password);
      if (user != null) {
        success();
      } else {
        setError('Usuario ou senha invalidos');
      }
    } on AuthExceptions catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      notifyListeners();
      await _userServices.forgotPassword(email);
      infoMessage = 'Solicitação de resete recebida, verifique seu e-mail';
    } on AuthExceptions catch (e) {
      setError(e.message);
    } catch (e) {
      setError('Erro ao resetar senha');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
