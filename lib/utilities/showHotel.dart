import 'package:flutter/material.dart';
import 'package:innstantbook/constants/hotel_list.dart';

class showHotel extends StatefulWidget {
  final int index;
  showHotel({super.key, required this.index});

  @override
  State<showHotel> createState() => _showHotelState();
}

class _showHotelState extends State<showHotel> {


  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 400,
        child: Card(
            child: Column(
          children: [
            Image.asset(assets[widget.index]),
            Text(
              hotelnames[widget.index],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )
          ],
        )),
      ),
    );
  }
}
