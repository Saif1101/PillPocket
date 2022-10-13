

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository{
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn; 

  AuthRepository({required this.firebaseAuth,required this.googleSignIn}); 

Future<void> signInWithGoogle() async {
    try {
      await googleSignIn.disconnect().catchError((e, stack) {
    print(e);
  });
      // final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // final GoogleSignInAuthentication? googleAuth =
      //     await googleUser?.authentication;

      // final credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth?.accessToken,
      //   idToken: googleAuth?.idToken,);
      
      // await FirebaseAuth.instance.signInWithCredential(credential);
      // print('User signed in');
      // print(FirebaseAuth.instance.currentUser);
  } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
  
    } catch (e) {
      throw Exception(e);
    }
  }

}


/* 

*/