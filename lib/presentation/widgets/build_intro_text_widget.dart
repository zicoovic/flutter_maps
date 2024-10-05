// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BuildIntroTexts extends StatelessWidget {
  final String phoneNumber;
  final String message;
  const BuildIntroTexts({
    super.key,
    required this.phoneNumber,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          phoneNumber,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            message,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
