import 'package:flutter/material.dart';

class AppPasswordValidation extends StatelessWidget {
  const AppPasswordValidation({
    super.key,
    required this.label,
    required this.isValid,
  });
  final String label;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: isValid ? Colors.green : Colors.black),
        Text(
          label,
          style: TextStyle(color: isValid ? Colors.green : Colors.black),
        ),
      ],
    );
  }
}
