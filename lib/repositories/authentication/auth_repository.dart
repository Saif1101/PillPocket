import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prescription_ocr/blocs/authentication/auth_bloc.dart';
import 'package:prescription_ocr/repositories/authentication/auth_exceptions.dart';

class AuthRepository {
  final _authController = StreamController<AuthStatus>();

  Stream<AuthStatus> get status async* {
    yield* _authController.stream;
  }

  GoogleSignIn googleSignIn = GoogleSignIn();

  final FirebaseAuth auth = FirebaseAuth.instance;

  late final StreamSubscription firebaseAuthSubscriber;

  AuthRepository() {
    firebaseAuthSubscriber = auth.authStateChanges().listen((user) {
      if (user == null) {
        _authController.add(AuthStatus.unauthenticated);
      } else {
        _authController.add(AuthStatus.authenticated);
      }
    });
  }

  void dispose() {
    firebaseAuthSubscriber.cancel();
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw InvalidEmailException("No user found for that email");
      } else if (e.code == 'wrong-password') {
        throw InvalidPasswordException("wrong-password");
      } else if (e.code == "invalid-email") {
        throw InvalidPasswordException("Invalid Email");
      } else {
        throw InvalidPasswordException("Something went wrong.");
      }
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      await googleSignIn.disconnect().catchError((e, stack) {
        print(e);
      });
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return authResult.user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }



  

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}


/* 

*/