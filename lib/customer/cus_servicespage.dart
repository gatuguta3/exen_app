import 'package:flutter/material.dart';

class CusServicespage extends StatefulWidget {
  const CusServicespage({super.key});

  @override
  State<CusServicespage> createState() => _CusServicespageState();
}

class _CusServicespageState extends State<CusServicespage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services Booking'),
      ),
    );
  }
}
