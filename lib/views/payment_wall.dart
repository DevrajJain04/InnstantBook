import 'package:flutter/material.dart';

class PaymentWall extends StatefulWidget {
  const PaymentWall({super.key});

  @override
  State<PaymentWall> createState() => _PaymentWallState();
}

class _PaymentWallState extends State<PaymentWall> {
  String selectedPaymentOption = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Options'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Select a payment option:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            _buildPaymentOption('Credit Card'),
            _buildPaymentOption('PayPal'),
            _buildPaymentOption('Google Pay'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (selectedPaymentOption.isNotEmpty) {
                  // Handle payment and book room
                  // _handlePaymentAndBooking();
                } else {
                  // Show a message to select a payment option
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select a payment option.'),
                    ),
                  );
                }
              },
              child: const Text('Book Room'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String option) {
    return ListTile(
      title: Text(option),
      leading: Radio(
        value: option,
        groupValue: selectedPaymentOption,
        onChanged: (value) {
          setState(() {
            selectedPaymentOption = value.toString();
          });
        },
      ),
    );
  }
}
