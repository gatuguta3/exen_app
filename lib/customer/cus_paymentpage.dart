import 'package:flutter/material.dart';

class CusPaymentpage extends StatefulWidget {
  const CusPaymentpage({super.key});

  @override
  State<CusPaymentpage> createState() => _CusPaymentpageState();
}

class _CusPaymentpageState extends State<CusPaymentpage> {
  @override
  Widget build(BuildContext context) {
    const text = const Text(
      'Payments',
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
