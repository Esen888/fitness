import 'dart:developer';
import 'package:BodyPower/features/user/domain/use_case/authentification_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'authentification_event.dart';
part 'authentification_state.dart';

class AuthentificationBloc
    extends Bloc<AuthentificationEvent, AuthentificationState> {
  final AuthentificationUseCase authUseCase;
  final auth = FirebaseAuth.instance;
  AuthentificationBloc({required this.authUseCase}) : super(UnAuthenticated()) {
    on<VerifySentOtpEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        // After receiving the otp, we will verify the otp and then will create a credential from the otp and verificationId and then will send it to the [OnPhoneAuthVerificationCompleteEvent] event to be handled by the bloc and then will emit the [PhoneAuthVerified] state after successful login
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: event.verificationId,
          smsCode: event.otpCode,
        );
        add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
      } catch (e) {
        emit(AuthError(error: e.toString()));
      }
    });

    on<OnPhoneAuthVerificationCompleteEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          await auth.signInWithCredential(event.credential).then((user) {
            if (user.user != null) {
              emit(PhoneAuthVerified());
            }
          });
        } on FirebaseAuthException catch (e) {
          emit(AuthError(error: e.code));
        } catch (e) {
          emit(AuthError(error: e.toString()));
        }
      },
    );

    on<OnPhoneOtpSent>((event, emit) =>
        emit(PhoneAuthCodeSentSuccess(verificationId: event.verificationId)));

    on<OnPhoneAuthErrorEvent>(
        (event, emit) => emit(AuthError(error: event.error)));

    on<SendOtpToPhoneEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await authUseCase.phoneAuthentication(
          phoneNumber: event.phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            // On [verificationComplete], we will get the credential from the firebase  and will send it to the [OnPhoneAuthVerificationCompleteEvent] event to be handled by the bloc and then will emit the [PhoneAuthVerified] state after successful login
            add(OnPhoneAuthVerificationCompleteEvent(credential: credential));
          },
          codeSent: (String verificationId, int? resendToken) {
            // On [codeSent], we will get the verificationId and the resendToken from the firebase and will send it to the [OnPhoneOtpSent] event to be handled by the bloc and then will emit the [OnPhoneAuthVerificationCompleteEvent] event after receiving the code from the user's phone
            add(OnPhoneOtpSent(
                verificationId: verificationId, token: resendToken));
          },
          verificationFailed: (FirebaseAuthException e) {
            // On [verificationFailed], we will get the exception from the firebase and will send it to the [OnPhoneAuthErrorEvent] event to be handled by the bloc and then will emit the [PhoneAuthError] state in order to display the error to the user's screen
            add(OnPhoneAuthErrorEvent(error: e.code));
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } catch (e) {
        log(e.toString());
        emit(AuthError(error: e.toString()));
      }
    });

    on<SignInRequested>((event, emit) async {
      emit(AuthLoadingState());

      await authUseCase
          .signIn(email: event.email, password: event.password)
          .then((value) => emit(Authenticated()))
          .onError((error, stackTrace) => emit(UnAuthenticated()));
    });

    on<SignUpRequested>((event, emit) async {
      emit(AuthLoadingState());
      await authUseCase
          .signUp(email: event.email, password: event.password)
          .then((value) => emit(Authenticated()))
          .onError((error, stackTrace) => emit(UnAuthenticated()));
    });

    on<GoogleSignInRequested>((event, emit) async {
      emit(AuthLoadingState());

      await authUseCase
          .signInWithGoogle()
          .then((value) => emit(Authenticated()))
          .onError((error, stackTrace) => emit(UnAuthenticated()));
    });

    on<AppleSignInRequested>((event, emit) async {
      emit(AuthLoadingState());
      await authUseCase
          .signInWithApple()
          .then((value) => emit(Authenticated()))
          .onError((error, stackTrace) => emit(UnAuthenticated()));
    });

    on<DeleteCurrentAccaunt>((event, emit) async {
      emit(AuthLoadingState());
      await authUseCase
          .deleteUserAccount()
          .whenComplete(() => emit(UnAuthenticated()))
          .onError((error, stackTrace) => AuthError(error: error.toString()));
    });

    on<SignOutRequested>((event, emit) async {
      emit(AuthLoadingState());
      await authUseCase
          .signOut()
          .whenComplete(() => emit(UnAuthenticated()))
          .onError((error, stackTrace) => AuthError(error: error.toString()));
    });
  }
}
