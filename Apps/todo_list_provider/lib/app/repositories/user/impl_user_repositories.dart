import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_list_provider/app/core/database/sqlite_connection_factory.dart';
import 'package:todo_list_provider/app/exeptions/auth_exeptions.dart';

import './user_repositories.dart';

class ImplUserRepositories implements UserRepositories {
  final FirebaseAuth _firebaseAuth;
  final SqliteConnectionFactory _connectionFactory;
  ImplUserRepositories(
      {required FirebaseAuth firebaseAuth,
      required SqliteConnectionFactory connectionFactory})
      : _firebaseAuth = firebaseAuth,
        _connectionFactory = connectionFactory;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredencial = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return userCredencial.user;
    } on FirebaseAuthException catch (e, s) {
      // email-already-exists
      if (e.code == 'email-already-in-use') {
        final loginTypes =
            await _firebaseAuth.fetchSignInMethodsForEmail(email);
        if (loginTypes.contains('password')) {
          throw AuthExceptions(
              message: 'E-mail ja utilizado, escolha outro para se registrar');
        } else {
          throw AuthExceptions(
              message:
                  'Você se cadastrou pelo Google, use o botão indicado para acessar o app');
        }
      } else {
        throw AuthExceptions(message: e.message ?? 'Erro ao registrar usuário');
      }
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on PlatformException catch (e, s) {
      throw AuthExceptions(message: e.message ?? 'Erro ao realizar login');
    } on FirebaseAuthException catch (e, s) {
      if (e.code == "wrong-password") {
        throw AuthExceptions(message: e.message ?? 'Erro ao realizar login');
      }
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final loginMethods =
          await _firebaseAuth.fetchSignInMethodsForEmail(email);

      if (loginMethods.contains('password')) {
        await _firebaseAuth.sendPasswordResetEmail(email: email);
      } else if (loginMethods.contains('google')) {
        throw AuthExceptions(
            message: 'Cadastro nao realizado por login e senha');
      } else {
        throw AuthExceptions(message: 'E-mail nao cadastrado');
      }
    } on PlatformException catch (e, s) {
      throw AuthExceptions(message: 'Erro ao resetar senha');
    }
  }

  @override
  Future<User?> googleLogin() async {
    List<String>? loginMethods;
    try {
      final googleSingIn = GoogleSignIn();
      final googleUser = await googleSingIn.signIn();
      if (googleUser != null) {
        loginMethods =
            await _firebaseAuth.fetchSignInMethodsForEmail(googleUser.email);

        if (loginMethods.contains('password')) {
          throw AuthExceptions(
              message:
                  'E-mail ja utilizado em outro cadastro, clique em "Esqueci a senha" para recuperar seu acesso');
        } else {
          final googleAuth = await googleUser.authentication;
          final firebaseCredential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
          var userCredential =
              await _firebaseAuth.signInWithCredential(firebaseCredential);
          return userCredential.user;
        }
      }
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);
      if (e.code == 'account-exists-with-different-credential') {
        throw AuthExceptions(
            message:
                '''Login não permitido, talvez você tenha se registrado com outro provedor!
                Algumas possibilidades:
                ${loginMethods?.join(',')}
                ''');
      } else {
        throw AuthExceptions(message: 'Erro ao realizar login');
      }
    }
  }

  @override
  Future<User?> logout() async {
    await _clearBD();
    await GoogleSignIn().signOut();
    _firebaseAuth.signOut();
  }

  @override
  Future<void> updateName(String name) async {
    final user = _firebaseAuth.currentUser;

    if (user != null) {
      await user.updateDisplayName(name);
      user.reload();
    }
  }

  Future<void> _clearBD() async {
    final conn = await _connectionFactory.openConnection();

    try {
      await conn.rawQuery('delete from todo');
    } catch (e) {
      print(e);
      throw AuthExceptions(message: 'Erro ao limpar tabela');
    }
  }

  @override
  Future<void> dellTask(int id) async {
    final conn = await _connectionFactory.openConnection();
    await conn.rawQuery('delete from todo where id = ?', [id]);
  }
}
