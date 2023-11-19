import 'package:flutter/material.dart';

// class MyTextField extends StatelessWidget {
//   final String hintText;
//   final IconData? icon;
//   final void Function()? onPressed;
//   final bool obscureText;

//   const MyTextField({
//     super.key,
//     required this.hintText,
//     this.icon,
//     this.onPressed,
//     this.obscureText = false,
//     required int maxLength,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 30),
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//       //padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//       decoration: BoxDecoration(
//         color: Colors.grey[600]!.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: TextField(
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
//           IconButton(onPressed: onPressed, icon: Icon(icon))
//         ],
//       ),
//     );
//   }
// }

class MyTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final void Function()? onPressed;
  final bool obscureText;
  final TextEditingController? controller; // Added this line

  const MyTextField({
    Key? key,
    required this.hintText,
    this.icon,
    this.onPressed,
    this.obscureText = false,
    required int maxLength,
    this.controller, // Added this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller, // Added this line
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              obscureText: obscureText,
            ),
          ),
          IconButton(
              onPressed: onPressed,
              icon: Icon(
                  icon ?? Icons.error)) // Used null-aware operator for icon
        ],
      ),
    );
  }
}
