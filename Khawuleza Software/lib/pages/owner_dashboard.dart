// ignore_for_file: unused_import, use_build_context_synchronously, avoid_print

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

// class OwnerDash extends StatefulWidget {
//   const OwnerDash({super.key});

//   @override
//   State<OwnerDash> createState() => _OwnerDash();
// }

// class _OwnerDash extends State<OwnerDash> {
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
//         appBar: AppBar(
//           //leading: const Icon(Icons.account_circle_rounded),
//           title: const Text("DASHBOARD"),
//           backgroundColor: const Color.fromARGB(255, 255, 77, 0),
//           centerTitle: true,
//         ),
//         drawer: const Drawer(),
//         body: const DecoratedBox(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 //opacity: 100,
//                 //colorFilter: ColorFilter.linearToSrgbGamma(),

//                 image: AssetImage("assets/backg_1.jpg"),
//                 fit: BoxFit.cover),
//           ),

//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:khawuleza/components/text_field.dart';

class OwnerDash extends StatefulWidget {
  const OwnerDash({Key? key}) : super(key: key);

  @override
  State<OwnerDash> createState() => _OwnerDashState();
}

class _OwnerDashState extends State<OwnerDash> {
  final TextEditingController _driverNameController = TextEditingController();
  final TextEditingController _driverSurnameController =
      TextEditingController();
  final TextEditingController _driverEmailController = TextEditingController();

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
        title: const Text("DASHBOARD"),
        backgroundColor: const Color.fromARGB(255, 255, 77, 0),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator(); // Loading indicator while data is being fetched
            }

            var userData = snapshot.data!.data() as Map<String, dynamic>;

            return ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 77, 0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Owner Name: ${userData['name']}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Owner Surname: ${userData['surname']}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Owner Email: ${userData['email']}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      // Add more fields as needed
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('Add Driver'),
                  onTap: () {
                    _showAddDriverDialog(context);
                  },
                ),
                // Add more drawer items as needed
              ],
            );
          },
        ),
      ),
      body: const DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backg_1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        // Your dashboard content goes here
      ),
    );
  }

  void _showAddDriverDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Driver'),
          content: Column(
            children: [
              MyTextField(
                controller: _driverNameController,
                hintText: 'Driver Name',
                maxLength: 50,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _driverSurnameController,
                hintText: 'Driver Surname',
                maxLength: 50,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _driverEmailController,
                hintText: 'Driver Email',
                maxLength: 50,
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: 'Driver Password',
                onPressed: showPassword,
                icon: showPass ? Icons.visibility_off : Icons.visibility,
                obscureText: showPass ? false : true,
                maxLength: 50,
              ),
              const SizedBox(height: 12),
              MyTextField(
                hintText: 'Confirm Password',
                onPressed: showConfPass,
                icon: showConfirm ? Icons.visibility_off : Icons.visibility,
                obscureText: showConfirm ? false : true,
                maxLength: 50,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _addDriverToFirestore();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Add Driver'),
            ),
          ],
        );
      },
    );
  }

  void _addDriverToFirestore() async {
    try {
      // Check if passwords match
      if (_driverNameController.text.isEmpty ||
          _driverSurnameController.text.isEmpty ||
          _driverEmailController.text.isEmpty) {
        // Show an error if any of the fields are empty
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('All fields are required.'),
          ),
        );
        return;
      }

      // Create a driver user in Firebase Authentication
      UserCredential driverCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _driverEmailController.text.trim(),
        password: _driverEmailController
            .text, // Use a secure method to generate passwords
      );

      // Store additional driver data in Firestore
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(driverCredential.user?.uid)
          .set({
        'name': _driverNameController.text,
        'surname': _driverSurnameController.text,
        'email': _driverEmailController.text.trim(),
        // Add more fields as needed
      });

      // Provide feedback to the user (e.g., show a SnackBar)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Driver added successfully.'),
        ),
      );
    } catch (e) {
      print('Error adding driver: $e');
      // Provide feedback to the user (e.g., show a SnackBar)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error adding driver. Please try again.'),
        ),
      );
    }
  }
}

// class MyTextField extends StatelessWidget {
//   final TextEditingController? controller;
//   final String hintText;
//   final IconData? icon;
//   final void Function()? onPressed;
//   final bool obscureText;

//   const MyTextField({
//     Key? key,
//     this.controller,
//     required this.hintText,
//     this.icon,
//     this.onPressed,
//     this.obscureText = false,
//     required int maxLength,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 30),
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//       decoration: BoxDecoration(
//         color: Colors.grey[600]!.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: TextField(
//               controller: controller,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: hintText,
//                 hintStyle: TextStyle(
//                   color: Colors.white.withOpacity(0.5),
//                 ),
//               ),
//               obscureText: obscureText,
//             ),
//           ),
//           IconButton(onPressed: onPressed, icon: Icon(icon)),
//         ],
//       ),
//     );
//   }
// }