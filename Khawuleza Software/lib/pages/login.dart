// ignore_for_file: unused_import, use_build_context_synchronously

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:khawuleza/components/button.dart';
// import 'package:khawuleza/components/text_field.dart';
// import 'package:khawuleza/pages/owner_registration.dart';
// import 'package:khawuleza/pages/user_registration.dart';
// import 'package:khawuleza/pages/com_dashboard.dart';
// import 'package:khawuleza/pages/owner_dashboard.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// //flutter login authentication

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPage();
// }

// class _LoginPage extends State<LoginPage> {
//   // Text editing controllers
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   //user sign in method
//   void signUserIn() async {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text, password: passwordController.text);
//   }

//   bool showPass = false;
//   showPassword() {
//     setState(() {
//       showPass = !showPass;
//     });
//   }

//   bool checkTheBox = false;
//   check() {
//     setState(() {
//       checkTheBox = !checkTheBox;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text("LOGIN"),
//         backgroundColor: const Color.fromARGB(255, 255, 77, 0),
//         centerTitle: true,
//       ),

//       // backgroundColor: const Color.fromARGB(255, 19, 18, 18),

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
//               const SizedBox(height: 5),
//               Image.asset(
//                 "assets/kk_loho.png",
//                 //color: const Color.fromARGB(255, 10, 185, 121),
//                 width: 300,
//                 color: const Color.fromARGB(156, 255, 255, 255),
//               ),
//               const SizedBox(height: 20),
//               const MyTextField(
//                 hintText: "Email or username",
//                 maxLength: 50,
//               ),
//               const SizedBox(height: 20),
//               MyTextField(
//                 hintText: "Password",
//                 onPressed: showPassword,
//                 icon: showPass ? Icons.visibility_off : Icons.visibility,
//                 obscureText: showPass ? false : true,
//                 maxLength: 50,
//               ),
//               const SizedBox(height: 12),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Theme(
//                           data: ThemeData(
//                             unselectedWidgetColor: Colors.grey[500],
//                           ),
//                           child: Checkbox(
//                             checkColor: Colors.white,
//                             value: checkTheBox ? true : false,
//                             onChanged: (value) {
//                               check();
//                             },
//                           ),
//                         ),
//                         const Text(
//                           "Remember me",
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         )
//                       ],
//                     ),
//                     const Text(
//                       "Forgot password?",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.cyan,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               MyButton(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const OwnerDash(),
//                     ),
//                   );
//                 },
//                 customColor: const Color.fromARGB(255, 10, 185, 121),
//                 text: "LOGIN",
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Don't have an account ?",
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(width: 5),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const UserRegistration()));
//                     },
//                     child: const Text(
//                       "REGISTER",
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 255, 77, 0),
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

//----------------------------GPT CODE-------------------------------------

// ignore_for_file: unused_import

// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khawuleza/components/button.dart';
import 'package:khawuleza/components/text_field.dart';
import 'package:khawuleza/pages/owner_dashboard.dart';
import 'package:khawuleza/pages/user_registration.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // User sign in method
  Future<void> signUserIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      // Navigate to the appropriate dashboard after successful login
      // You may need to determine the user type and navigate accordingly
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OwnerDash(),
        ),
      );
    } catch (e) {
      Text("Error during login: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid email or password."),
        ),
      );
    }
  }

  bool showPass = false;
  showPassword() {
    setState(() {
      showPass = !showPass;
    });
  }

  bool checkTheBox = false;
  check() {
    setState(() {
      checkTheBox = !checkTheBox;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("LOGIN"),
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
              const SizedBox(height: 5),
              Image.asset(
                "assets/kk_loho.png",
                width: 300,
                color: const Color.fromARGB(156, 255, 255, 255),
              ),
              const SizedBox(height: 20),
              MyTextField(
                controller: emailController,
                hintText: "Email or username",
                maxLength: 50,
              ),
              const SizedBox(height: 20),
              MyTextField(
                controller: passwordController,
                hintText: "Password",
                onPressed: showPassword,
                icon: showPass ? Icons.visibility_off : Icons.visibility,
                obscureText: showPass ? false : true,
                maxLength: 50,
              ),
              const SizedBox(height: 12),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Colors.grey[500],
                          ),
                          child: Checkbox(
                            checkColor: Colors.white,
                            value: checkTheBox,
                            onChanged: (value) {
                              check();
                            },
                          ),
                        ),
                        const Text(
                          "Remember me",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              MyButton(
                onTap: () {
                  signUserIn(context);
                },
                customColor: const Color.fromARGB(255, 10, 185, 121),
                text: "LOGIN",
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account ?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserRegistration(),
                        ),
                      );
                    },
                    child: const Text(
                      "REGISTER",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 77, 0),
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


//---------------------------------------------------------------------------