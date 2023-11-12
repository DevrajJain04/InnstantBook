import 'package:flutter/material.dart';

class PaymentWall extends StatefulWidget {
  const PaymentWall({super.key});

  @override
  State<PaymentWall> createState() => _PaymentWallState();
}

class _PaymentWallState extends State<PaymentWall> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods Available'),
      ),
      body: Card(),
    );
  }
}
