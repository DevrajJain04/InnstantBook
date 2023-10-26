import 'package:flutter/material.dart';

class HotelDesc extends StatelessWidget {
  final item;
  const HotelDesc({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item),
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
