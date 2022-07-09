import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_provider/app/repositories/user/user_repositories.dart';

import './user_services.dart';

class ImplUserServices implements UserServices {
  final UserRepositories _userRepository;

  ImplUserServices({required UserRepositories userRepository})
      : _userRepository = userRepository;
  @override
  Future<User?> register(String email, String password) =>
      _userRepository.register(email, password);

  @override
  Future<User?> login(String email, String password) =>
      _userRepository.login(email, password);

  @override
  Future<void> forgotPassword(String email) =>
      _userRepository.forgotPassword(email);

  @override
  Future<User?> googleLogin() => _userRepository.googleLogin();

  @override
  Future<User?> logout() => _userRepository.logout();

  @override
  Future<void> updateName(String name) => _userRepository.updateName(name);
}
