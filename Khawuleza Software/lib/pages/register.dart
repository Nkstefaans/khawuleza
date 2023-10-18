import 'package:flutter/material.dart';
import 'package:khawuleza/components/button.dart';
import 'package:khawuleza/components/text_field.dart';
import 'package:khawuleza/components/text_edit_controller.dart';
import 'package:khawuleza/pages/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final myController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REGISTER"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 19, 18, 18),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const MyTextField(
                hintText: "Name and Surname",
                maxLength: 50,
              ),
              const SizedBox(height: 10),
              const MyTextField(
                hintText: "Cellphone number",
                maxLength: 10,
              ),
              const SizedBox(height: 10),
              const MyTextField(
                  maxLength: 10, hintText: "Enter your TAG ID number"),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Pin",
                onPressed: showPassword,
                icon: showPass ? Icons.visibility_off : Icons.visibility,
                obscureText: showPass ? false : true,
                maxLength: 20,
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Confirm pin",
                onPressed: showConfPass,
                icon: showConfirm ? Icons.visibility_off : Icons.visibility,
                obscureText: showConfirm ? false : true,
                maxLength: 50,
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Password",
                onPressed: showPassword,
                icon: showPass ? Icons.visibility_off : Icons.visibility,
                obscureText: showPass ? false : true,
                maxLength: 50,
              ),
              const SizedBox(height: 12),
              MyTextField(
                hintText: "Confirm password",
                onPressed: showConfPass,
                icon: showConfirm ? Icons.visibility_off : Icons.visibility,
                obscureText: showConfirm ? false : true,
                maxLength: 50,
              ),
              const SizedBox(height: 30),
              MyButton(
                customColor: const Color.fromARGB(255, 51, 153, 53),
                text: "Register",

                ///ADD ACTION TO SEDN DATA TO FIREBASE
                onTap: () {},
              ),
              const SizedBox(height: 20),
              const Text(
                "Or sign up with",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*
                  Button as facebook logo
                   */
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade700),
                    ),
                    child: Image.asset("assets/facebook.png", width: 50),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade700),
                    ),
                    child: Image.asset("assets/google.png", width: 50),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade700),
                    ),
                    child: Icon(
                      Icons.apple,
                      size: 50,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
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
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "LOG IN",
                      style: TextStyle(
                        color: Color.fromARGB(255, 10, 185, 121),
                        fontWeight: FontWeight.bold,
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
