import 'package:flutter/material.dart';

class CusFaqs extends StatefulWidget {
  const CusFaqs({super.key});

  @override
  State<CusFaqs> createState() => _CusFaqsState();
}

class _CusFaqsState extends State<CusFaqs> {
  @override
  Widget build(BuildContext context) {
    const text = const Text(
      'FAQs',
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
