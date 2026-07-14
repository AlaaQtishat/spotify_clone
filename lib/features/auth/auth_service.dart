import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> signUpEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user != null) {
      await userCredential.user!.updateDisplayName(name);
      await userCredential.user!.reload();
      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'full_name': name,
        'email': email,
        'photoUrl': "",
      });
    }
  }

  Future<void> loginEmailPassword({
    required String email,
    required String password,
  }) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
