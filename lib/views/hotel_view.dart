import 'package:flutter/material.dart';

class HotelDesc extends StatelessWidget {
  final item;
  HotelDesc({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item),
      ),
      body: Container(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}
