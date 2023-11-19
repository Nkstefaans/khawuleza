// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khawuleza/pages/home.dart';
import 'package:khawuleza/pages/auth.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Initialize Firebase asynchronously
Future<void> initializeFirebase() async {
  try {
    // Ensure Firebase is initialized before using Firebase services
    await Firebase.initializeApp();
    const Text("Firebase initialized successfully");

    // Now you can use Firebase services like Firebase Authentication, Firestore, etc.
    // For example, initializing Firebase Authentication:
    // await FirebaseAuth.instance.authStateChanges().first;
    // ...
  } catch (e) {
    Text("Error initializing Firebase: $e");
  }
}

void main() async {
  //Initializing Database when starting the application.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBZbS4pVmHppGcbj0kxq0n2OHq13fDIAN4',
          appId: '1:205624348564:android:736b4558c1a97a26fa0981',
          messagingSenderId: '205624348564',
          projectId: 'khawuleza-app'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegisterPage(),
      //home: const Auth(),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:khawuleza/pages/auth.dart';

// // Import the firebase_core plugin
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         textTheme: GoogleFonts.poppinsTextTheme(
//           Theme.of(context).textTheme,
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const Auth(),
//     );
//   }
// }
