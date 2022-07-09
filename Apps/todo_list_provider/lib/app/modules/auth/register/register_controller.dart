import 'package:todo_list_provider/app/exeptions/auth_exeptions.dart';
import '../../../core/notifier/default_change_notifier.dart';
import '../../../services/user/user_services.dart';

class RegisterController extends DefaultChangeNotifier {
  final UserServices _userServices;

  RegisterController({required UserServices userServices})
      : _userServices = userServices;

  Future<void> registerUser(String email, String password) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      final user = await _userServices.register(email, password);

      if (user != null) {
        // sucesso
        success();
      } else {
        // Erro
        setError('Erro ao registrar usuario');
      }
    } on AuthExceptions catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
