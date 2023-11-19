import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khawuleza/pages/home.dart';
import 'package:khawuleza/pages/login.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in
          if (snapshot.hasData) {
            return const LoginOrRegisterPage();
          }

          //user not logged in
          else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
