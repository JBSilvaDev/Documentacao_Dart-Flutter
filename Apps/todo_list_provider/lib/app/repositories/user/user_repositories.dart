import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepositories {
  Future<User?> register(String email, String password);
  Future<User?> login(String email, String password);
  Future<void> forgotPassword(String email);
  Future<User?> googleLogin();
  Future<User?> logout();
  Future<void> updateName(String name);
  Future<void> dellTask(int id);
  
}
