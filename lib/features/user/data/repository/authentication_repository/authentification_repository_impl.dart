import 'dart:developer';
import 'package:BodyPower/features/user/domain/repositories/authentification_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthentificationRepositoryImpl implements AuthentificationRepository {
  final _auth = FirebaseAuth.instance;
  var verificationId = "";

  @override
  Future<void> signInWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
    } catch (e) {
      log("ERROR   GOOGLE SIGN IN ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _auth.signInWithCredential(credential);
    } catch (e) {
      log("ERROR   GOOGLE SIGN IN ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log("Errror  ${e.code.toString()}");
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      log(" ERRROOORRR  ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log("user-not-found  ${e.code.toString()}");
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log("wrong-password     ${e.code.toString()}");
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  @override
  Future<void> phoneAuthentication({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      verificationFailed: verificationFailed,
      // (e) {
      //   // verificationFailed;
      //   log(e.code.toString());
      //   // if (e.code == "invalid-phone-number") {
      //   //   log("invalid-phone-number ----  ${e.code.toString()}");
      //   // } else {
      //   //   log("Phone verificationfailed    ${e.code.toString()}");
      //   // }
      // },
    );
  }

  @override
  Future<bool> verifyOTP({required String otp}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;
      return user != null ? true : false;
    } catch (e) {
      log('Verification failed: ${e.toString()}');
      throw e;
    }
  }

  @override
  Future<void> deleteUserAccount() async {
    try {
      User user = FirebaseAuth.instance.currentUser!;
      // if (user == null) {
      await user.delete();
      // } else {}
    } catch (e) {
      log(e.toString());
    }
  }

  // @override
  // Future<void> signInWithApple() async {

  //    final appleCredential = await SignInWithApple.getAppleIDCredential(
  //           scopes: [
  //             AppleIDAuthorizationScopes.email,
  //             AppleIDAuthorizationScopes.fullName,
  //           ],
  //           webAuthenticationOptions: WebAuthenticationOptions(
  //             clientId: 'YOUR_CLIENT_ID',
  //             redirectUri: Uri.parse('https://example.com/callback'),
  //           ),
  //         );

  //         final oauthCredential = OAuthProvider("apple.com").credential(
  //           idToken: appleCredential.identityToken,
  //           rawNonce: appleCredential.nonce,
  //         );

  //         final firebaseUser =
  //             await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  // }
}
