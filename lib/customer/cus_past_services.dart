import 'package:flutter/material.dart';

class CusPastServices extends StatefulWidget {
  const CusPastServices({super.key});

  @override
  State<CusPastServices> createState() => _CusPastServicesState();
}

class _CusPastServicesState extends State<CusPastServices> {
  @override
  Widget build(BuildContext context) {
    const text = const Text(
      'Service History',
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
