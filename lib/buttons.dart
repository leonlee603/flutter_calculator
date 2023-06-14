import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String buttonText;

  const MyButton({
    required this.color,
    required this.textColor,
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: color,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                  color: textColor, fontSize: 27, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
