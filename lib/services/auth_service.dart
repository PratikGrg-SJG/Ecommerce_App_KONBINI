import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:konbini/services/firebase_service.dart';

class AuthService {
  final FirebaseService _service = FirebaseService();

  Future<void> signUp({
    required String emailController,
    required String passwordController,
    required String userName,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController,
        password: passwordController,
      );

      await _service.user.doc(userCredential.user!.uid).set({
        'userName': userName,
        // 'role': 'User',
      });
    } catch (e) {
      print("Error during sign-up: $e");
    }
  }

  //vendor
  Future<void> vendorSignUp({
    required String emailController,
    required String passwordController,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController,
        password: passwordController,
      );
    } catch (e) {
      print("Error during sign-up: $e");
    }
  }

  Future login(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Login successful, userCredential.user contains the logged-in user information.
      print('Logged in user: ${userCredential.user}');

      // Redirect to the main app screen or do any other necessary actions
    } catch (e) {
      // Handle login errors
      print('Login error: $e');
      return e;
      // Display error message to the user or take appropriate action
    }
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      rethrow;
    }
  }
}
