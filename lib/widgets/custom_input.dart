import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TextEditingController controllered;
  final String textName;

  const CustomButton({
    super.key,
    required this.controllered,
    required this.textName,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllered,
      decoration: InputDecoration(
        hintText: textName,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
      ),
    );
  }
}
