// // ignore_for_file: unused_import

// import 'package:flutter/material.dart';
// import 'package:khawuleza/components/button.dart';
// import 'package:khawuleza/components/text_field.dart';
// import 'package:khawuleza/components/text_edit_controller.dart';
// import 'package:khawuleza/pages/login.dart';
// //Firebase packages
// // Import the firebase_core plugin
// import 'package:firebase_core/firebase_core.dart';
// //Import firestore database
// import 'package:cloud_firestore/cloud_firestore.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => SignUpState();
// }

// class SignUpState extends State<SignUp> {
//   final myController = TextEditingController();
//   bool showPass = false;
//   bool showConfirm = false;
//   showConfPass() {
//     setState(() {
//       showConfirm = !showConfirm;
//     });
//   }

//   showPassword() {
//     setState(() {
//       showPass = !showPass;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("REGISTER"),
//         backgroundColor: const Color.fromARGB(255, 255, 77, 0),
//         centerTitle: true,
//       ),

//       //backgroundColor: const Color.fromARGB(255, 19, 18, 18),
//       body: DecoratedBox(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//               //opacity: 100,
//               //colorFilter: ColorFilter.linearToSrgbGamma(),
//               image: AssetImage("assets/backg_1.jpg"),
//               fit: BoxFit.cover),
//         ),
//         child: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 10),
//               const MyTextField(
//                 hintText: "Name and Surname",
//                 maxLength: 50,
//               ),
//               const SizedBox(height: 10),
//               const MyTextField(
//                 hintText: "Cellphone number",
//                 maxLength: 10,
//               ),
//               const SizedBox(height: 10),
//               const MyTextField(
//                   maxLength: 10, hintText: "Enter your TAG ID number"),
//               const SizedBox(height: 10),
//               MyTextField(
//                 hintText: "Pin",
//                 onPressed: showPassword,
//                 icon: showPass ? Icons.visibility_off : Icons.visibility,
//                 obscureText: showPass ? false : true,
//                 maxLength: 20,
//               ),
//               const SizedBox(height: 10),
//               MyTextField(
//                 hintText: "Confirm pin",
//                 onPressed: showConfPass,
//                 icon: showConfirm ? Icons.visibility_off : Icons.visibility,
//                 obscureText: showConfirm ? false : true,
//                 maxLength: 50,
//               ),
//               const SizedBox(height: 10),
//               MyTextField(
//                 hintText: "Password",
//                 onPressed: showPassword,
//                 icon: showPass ? Icons.visibility_off : Icons.visibility,
//                 obscureText: showPass ? false : true,
//                 maxLength: 50,
//               ),
//               const SizedBox(height: 12),
//               MyTextField(
//                 hintText: "Confirm password",
//                 onPressed: showConfPass,
//                 icon: showConfirm ? Icons.visibility_off : Icons.visibility,
//                 obscureText: showConfirm ? false : true,
//                 maxLength: 50,
//               ),
//               const SizedBox(height: 20),
//               MyButton(
//                 customColor: const Color.fromARGB(255, 51, 153, 53),
//                 text: "Register",

//                 ///ADD ACTION TO SEDN DATA TO FIREBASE
//                 onTap: () {},
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Already have an account ?",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SignInPage(),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       "LOG IN",
//                       style: TextStyle(
//                         color: Color.fromRGBO(255, 77, 0, 100),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:khawuleza/components/button.dart';
// // import 'package:khawuleza/components/text_field.dart';
// // import 'package:khawuleza/pages/login.dart';

// // class SignUp extends StatefulWidget {
// //   const SignUp({super.key});

// //   @override
// //   State<SignUp> createState() => SignUpState();
// // }

// // class SignUpState extends State<SignUp> {
// //   final myController = TextEditingController();
// //   bool showPass = false;
// //   bool showConfirm = false;

// //   showConfPass() {
// //     setState(() {
// //       showConfirm = !showConfirm;
// //     });
// //   }

// //   showPassword() {
// //     setState(() {
// //       showPass = !showPass;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("REGISTER"),
// //         backgroundColor: const Color.fromARGB(255, 255, 77, 0),
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         child: DecoratedBox(
// //           decoration: const BoxDecoration(
// //             image: DecorationImage(
// //               image: AssetImage("assets/backg_1.jpg"),
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           child: SafeArea(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Container(
// //                   padding: const EdgeInsets.only(bottom: 20, top: 15),
// //                   child: Image.asset(
// //                     "assets/kk_loho.png",
// //                     width: 300,
// //                     color: const Color.fromARGB(156, 255, 255, 255),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 40),
// //                 const MyTextField(
// //                   hintText: "Name and Surname",
// //                   maxLength: 50,
// //                 ),
// //                 const SizedBox(height: 10),
// //                 const MyTextField(
// //                   hintText: "Cellphone number",
// //                   maxLength: 10,
// //                 ),
// //                 const SizedBox(height: 10),
// //                 const MyTextField(
// //                   maxLength: 10,
// //                   hintText: "Enter your TAG ID number",
// //                 ),
// //                 const SizedBox(height: 10),
// //                 MyTextField(
// //                   hintText: "Pin",
// //                   onPressed: showPassword,
// //                   icon: showPass ? Icons.visibility_off : Icons.visibility,
// //                   obscureText: showPass ? false : true,
// //                   maxLength: 20,
// //                 ),
// //                 const SizedBox(height: 10),
// //                 MyTextField(
// //                   hintText: "Confirm pin",
// //                   onPressed: showConfPass,
// //                   icon: showConfirm ? Icons.visibility_off : Icons.visibility,
// //                   obscureText: showConfirm ? false : true,
// //                   maxLength: 50,
// //                 ),
// //                 const SizedBox(height: 10),
// //                 MyTextField(
// //                   hintText: "Password",
// //                   onPressed: showPassword,
// //                   icon: showPass ? Icons.visibility_off : Icons.visibility,
// //                   obscureText: showPass ? false : true,
// //                   maxLength: 50,
// //                 ),
// //                 const SizedBox(height: 12),
// //                 MyTextField(
// //                   hintText: "Confirm password",
// //                   onPressed: showConfPass,
// //                   icon: showConfirm ? Icons.visibility_off : Icons.visibility,
// //                   obscureText: showConfirm ? false : true,
// //                   maxLength: 50,
// //                 ),
// //                 const SizedBox(height: 30),
// //                 MyButton(
// //                   customColor: const Color.fromARGB(255, 51, 153, 53),
// //                   text: "Register",
// //                   onTap: () {},
// //                 ),
// //                 const SizedBox(height: 10),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     const Text(
// //                       "Already have an account ?",
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                     const SizedBox(width: 20),
// //                     GestureDetector(
// //                       onTap: () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => const SignInPage(),
// //                           ),
// //                         );
// //                       },
// //                       child: const Text(
// //                         "LOG IN",
// //                         style: TextStyle(
// //                           color: Color.fromARGB(255, 77, 0, 100),
// //                           fontWeight: FontWeight.bold,
// //                           fontSize: 18,
// //                         ),
// //                       ),
// //                     )
// //                   ],
// //                 )
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
