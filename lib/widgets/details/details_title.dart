import 'package:flutter/material.dart';

class DetailTitle extends StatelessWidget {
  final int id;
  final String type;

  const DetailTitle({super.key, required this.id, required this.type});

  @override
  Widget build(BuildContext context) {
    // Capitalize the first letter
    String capitalizedType = type.isNotEmpty
        ? type[0].toUpperCase() + type.substring(1)
        : type;

    return Padding(
      padding: const EdgeInsets.only(top: 40.0), // Adjust top padding
      child: Chip(
        backgroundColor: Color(0xFFB85042),
        label: Text(
          capitalizedType,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}