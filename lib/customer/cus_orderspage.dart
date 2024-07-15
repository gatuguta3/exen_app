import 'package:flutter/material.dart';

class CusOrderspage extends StatefulWidget {
  const CusOrderspage({super.key});

  @override
  State<CusOrderspage> createState() => _CusOrderspageState();
}

class _CusOrderspageState extends State<CusOrderspage> {
  @override
  Widget build(BuildContext context) {
    const text = const Text(
      'Orders',
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
