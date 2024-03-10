import 'package:firebase_auth/firebase_auth.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:vitclubs/Toast/toast.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signupEandP(
      String email, String password, String displayName) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;
      if (user != null) {
        await user.updateDisplayName(displayName);
        return user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        //showToast(message: 'The email is already in use');
      } else {
        //showToast(message: "An error occured: ${e.code}");
      }
    }
    return null;
  }

  Future<User?> loginEandP(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        //showToast(message: 'Invalid email or password');
      } else {
        //showToast(message: "An error occured: ${e.code}");
      }
    }
    return null;
  }
}
