import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color customColor;
  final String text;
  final void Function()? onTap;
  const MyButton({
    super.key,
    required this.customColor,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromARGB(255, 154, 99, 189),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
