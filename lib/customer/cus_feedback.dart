import 'package:flutter/material.dart';

class CusFeedback extends StatefulWidget {
  const CusFeedback({super.key});

  @override
  State<CusFeedback> createState() => _CusFeedbackState();
}

class _CusFeedbackState extends State<CusFeedback> {
  @override
  Widget build(BuildContext context) {
    const text = const Text(
      'Feedback',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
    return Scaffold(
      appBar: AppBar(
        title: text,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
    );
  }
}
