import 'package:flutter/material.dart';
import 'package:khawuleza/components/button.dart';
import 'package:khawuleza/components/text_field.dart';
import 'package:khawuleza/pages/register.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
      appBar: AppBar(
        title: const Text("LOGIN"),
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
              Image.asset(
                "assets/my_logo.png",
                color: const Color.fromARGB(255, 10, 185, 121),
                width: 300,
              ),
              const SizedBox(height: 40),
              const MyTextField(
                hintText: "Email or username",
                maxLength: 50,
              ),
              const SizedBox(height: 20),
              MyTextField(
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
                            value: checkTheBox ? true : false,
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
                customColor: const Color.fromARGB(255, 10, 185, 121),
                text: "Login",
                onTap: () {},
              ),
              const SizedBox(height: 20),
              const Text(
                "Or sign in with",
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
                    "Don't have an account ?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                    child: const Text(
                      "REGISTER",
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
