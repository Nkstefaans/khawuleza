// ignore_for_file: unused_import, use_build_context_synchronously

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

// class UserRegistration extends StatefulWidget {
//   const UserRegistration({super.key});

//   @override
//   State<UserRegistration> createState() => _UserRegistration();
// }

// class _UserRegistration extends State<UserRegistration> {
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
//                 hintText: "Name",
//                 maxLength: 50,
//               ),
//               const SizedBox(height: 10),
//               const MyTextField(
//                 hintText: "Surname",
//                 maxLength: 50,
//               ),
//               const SizedBox(height: 10),
//               const MyTextField(
//                 hintText: "Cellphone number",
//                 maxLength: 10,
//               ),
//               //const SizedBox(height: 10),
//               // const MyTextField(
//               //     maxLength: 10, hintText: "Enter your TAG ID number"),
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
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const LoginPage(),
//                     ),
//                   );
//                 },
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
//                           builder: (context) => const LoginPage(),
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
////------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:khawuleza/components/button.dart';
import 'package:khawuleza/components/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khawuleza/pages/login.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => UserRegistrationState();
}

class UserRegistrationState extends State<UserRegistration> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _cellphoneController = TextEditingController();
  //final TextEditingController _taxiAssociationNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool showPass = false;
  bool showConfirm = false;

  showConfPass() {
    setState(() {
      showConfirm = !showConfirm;
    });
  }

  showPassword() {
    setState(() {
      showPass = !showPass;
    });
  }

  void registerUser() async {
    try {
      // Check if passwords match
      if (_passwordController.text != _confirmPasswordController.text) {
        // Passwords don't match, show an error or provide feedback
        // For example:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Passwords do not match."),
          ),
        );
        return;
      }

      // Create a user in Firebase Authentication
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      // Now, you can access the user details using userCredential.user
      // ignore: avoid_print
      print("User registered: ${userCredential.user?.uid}");

      // Store additional user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'name': _nameController.text,
        'surname': _surnameController.text,
        'cellphone': _cellphoneController.text,
        //'taxiAssociationNumber': _taxiAssociationNumberController.text,
        'email': _emailController.text.trim(),

        // Add more fields as needed
      });

      // Navigate to the login page after successful registration
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    } catch (e) {
      // ignore: avoid_print
      print("Error during registration: $e");

      // Provide feedback to the user (e.g., show a SnackBar)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registration failed. Please check your information."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REGISTER"),
        backgroundColor: const Color.fromARGB(255, 255, 77, 0),
        centerTitle: true,
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backg_1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              MyTextField(
                controller: _nameController,
                hintText: "Name",
                maxLength: 50,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _surnameController,
                hintText: "Surname",
                maxLength: 50,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _cellphoneController,
                hintText: "Cellphone number",
                maxLength: 10,
              ),
              // const SizedBox(height: 10),
              // MyTextField(
              //   controller: _taxiAssociationNumberController,
              //   hintText: "Taxi association number",
              //   maxLength: 10,
              // ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _emailController,
                hintText: "Email address",
                maxLength: 10,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _passwordController,
                hintText: "Password",
                onPressed: showPassword,
                icon: showPass ? Icons.visibility_off : Icons.visibility,
                obscureText: showPass ? false : true,
                maxLength: 50,
              ),
              const SizedBox(height: 12),
              MyTextField(
                controller: _confirmPasswordController,
                hintText: "Confirm password",
                onPressed: showConfPass,
                icon: showConfirm ? Icons.visibility_off : Icons.visibility,
                obscureText: showConfirm ? false : true,
                maxLength: 50,
              ),
              const SizedBox(height: 20),
              MyButton(
                customColor: const Color.fromARGB(255, 51, 153, 53),
                text: "Register",
                onTap: registerUser,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account ?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "LOG IN",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 77, 0, 100),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
///
///
///-----------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:khawuleza/components/button.dart';
// import 'package:khawuleza/components/text_field.dart';
// import 'package:khawuleza/pages/login.dart';

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
//       body: SingleChildScrollView(
//         child: DecoratedBox(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/backg_1.jpg"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: SafeArea(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(bottom: 20, top: 15),
//                   child: Image.asset(
//                     "assets/kk_loho.png",
//                     width: 300,
//                     color: const Color.fromARGB(156, 255, 255, 255),
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 const MyTextField(
//                   hintText: "Name and Surname",
//                   maxLength: 50,
//                 ),
//                 const SizedBox(height: 10),
//                 const MyTextField(
//                   hintText: "Cellphone number",
//                   maxLength: 10,
//                 ),
//                 const SizedBox(height: 10),
//                 const MyTextField(
//                   maxLength: 10,
//                   hintText: "Enter your TAG ID number",
//                 ),
//                 const SizedBox(height: 10),
//                 MyTextField(
//                   hintText: "Pin",
//                   onPressed: showPassword,
//                   icon: showPass ? Icons.visibility_off : Icons.visibility,
//                   obscureText: showPass ? false : true,
//                   maxLength: 20,
//                 ),
//                 const SizedBox(height: 10),
//                 MyTextField(
//                   hintText: "Confirm pin",
//                   onPressed: showConfPass,
//                   icon: showConfirm ? Icons.visibility_off : Icons.visibility,
//                   obscureText: showConfirm ? false : true,
//                   maxLength: 50,
//                 ),
//                 const SizedBox(height: 10),
//                 MyTextField(
//                   hintText: "Password",
//                   onPressed: showPassword,
//                   icon: showPass ? Icons.visibility_off : Icons.visibility,
//                   obscureText: showPass ? false : true,
//                   maxLength: 50,
//                 ),
//                 const SizedBox(height: 12),
//                 MyTextField(
//                   hintText: "Confirm password",
//                   onPressed: showConfPass,
//                   icon: showConfirm ? Icons.visibility_off : Icons.visibility,
//                   obscureText: showConfirm ? false : true,
//                   maxLength: 50,
//                 ),
//                 const SizedBox(height: 30),
//                 MyButton(
//                   customColor: const Color.fromARGB(255, 51, 153, 53),
//                   text: "Register",
//                   onTap: () {},
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Already have an account ?",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const SignInPage(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         "LOG IN",
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 77, 0, 100),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
