import 'package:flutter/material.dart';

class SharedOnBordingWidgets extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const SharedOnBordingWidgets({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(imagePath, width: 300, fit: BoxFit.cover),
          Text(title),
          Text(description),
        ],
      ),
    );
  }
}
