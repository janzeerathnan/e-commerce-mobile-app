import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  print('--- Starting Test User Creation ---');

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('✅ Firebase Initialized');

    final email = 'baner@gmail.com';
    final password = 'baner123@';

    print('Attempting to create user: $email');

    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    print('✅ SUCCESS! User created: ${credential.user?.uid}');
  } on FirebaseAuthException catch (e) {
    print('❌ Firebase Error: ${e.code}');
    print('Message: ${e.message}');
    if (e.code == 'configuration-not-found') {
      print(
        '\n👉 ACTION REQUIRED: Enable "Email/Password" in the Firebase Console!',
      );
      print(
        'Link: https://console.firebase.google.com/project/e-commerce-app-5126b/authentication/providers',
      );
    }
  } catch (e) {
    print('❌ General Error: $e');
  }
}
