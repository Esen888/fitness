import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthentificationRepository {
  Future<void> phoneAuthentication({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  });
  Future<bool> verifyOTP({required String otp});
  Future<void> signUp({required String email, required String password});
  Future<void> signIn({required String email, required String password});
  Future<void> signOut();
  Future<void> signInWithGoogle();
  Future<void> signInWithApple();
   Future<void> deleteUserAccount();
  // Future<void> signInWithApple();
}
