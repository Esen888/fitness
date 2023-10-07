import 'package:BodyPower/features/user/data/repository/authentication_repository/authentification_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthentificationUseCase {
  AuthentificationRepositoryImpl authentificationRepositoryImpl =
      AuthentificationRepositoryImpl();
  Future<void> phoneAuthentication({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async =>
      await authentificationRepositoryImpl.phoneAuthentication(
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);

  Future<bool> verifyOTP({required String otp}) async =>
      await authentificationRepositoryImpl.verifyOTP(otp: otp);

  Future<void> signUp(
          {required String email, required String password}) async =>
      await authentificationRepositoryImpl.signUp(
          email: email, password: password);

  Future<void> signIn(
          {required String email, required String password}) async =>
      await authentificationRepositoryImpl.signIn(
          email: email, password: password);

  Future<void> signOut() async =>
      await authentificationRepositoryImpl.signOut();

  Future<void> signInWithGoogle() async =>
      await authentificationRepositoryImpl.signInWithGoogle();

  Future<void> signInWithApple() async =>
      await authentificationRepositoryImpl.signInWithApple();

  Future<void> deleteUserAccount() async =>
      await authentificationRepositoryImpl.deleteUserAccount();
}
