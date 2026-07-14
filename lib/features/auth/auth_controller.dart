import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/features/auth/auth_service.dart';

class AuthController {
  AuthService authService = AuthService();

  Future<String?> loginEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      await authService.loginEmailPassword(email: email, password: password);

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "something went wrong, please try again later.";
    }
  }

  Future<String?> signUpEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await authService.signUpEmailPassword(
        email: email,
        password: password,
        name: name,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "something went wrong, please try again later.";
    }
  }

  Future<String?> resetPassword({required String email}) async {
    try {
      await authService.resetPassword(email);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "something went wrong, please try again later.";
    }
  }

  Future<String?> logout() async {
    try {
      await authService.logout();
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "something went wrong, please try again later.";
    }
  }
}
