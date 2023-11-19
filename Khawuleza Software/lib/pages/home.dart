import 'package:flutter/material.dart';
import 'package:khawuleza/components/button.dart';
//import 'package:khawuleza/pages/login.dart';

//import 'package:khawuleza/pages/register.dart';
import 'package:khawuleza/pages/owner_registration.dart';
import 'package:khawuleza/pages/user_registration.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/backg_1.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Image.asset(
                      "assets/kk_loho.png",
                      width: 300,
                      color: const Color.fromARGB(156, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(height: 80),

                  const Text(
                    "Choose a profile to register as",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 50),
                  // sign in button
                  MyButton(
                    customColor: const Color.fromARGB(156, 255, 255, 255),
                    text: "TAXI OWNER",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OwnerRegistration(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 30),

                  //Button to register user and tag
                  MyButton(
                    customColor: const Color.fromARGB(156, 255, 255, 255),
                    text: "COMMUTER",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserRegistration(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              const Spacer(),
              // Footer
              // Container(
              //   margin: const EdgeInsets.only(bottom: 40),
              //   child: const Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         "Terms of use",
              //         style: TextStyle(
              //           color: const Color.fromARGB(156, 255, 255, 255),
              //         ),
              //       ),
              //       SizedBox(width: 20),
              //       Text(
              //         "Privacy Policy",
              //         style: TextStyle(
              //           color: const Color.fromARGB(156, 255, 255, 255),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
