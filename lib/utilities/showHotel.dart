import 'package:flutter/material.dart';
import 'package:innstantbook/constants/hotel_list.dart';
import 'package:innstantbook/views/hotel_detail_view.dart';

class ShowHotel extends StatefulWidget {
  final int index;
  const ShowHotel({super.key, required this.index});

  @override
  State<ShowHotel> createState() => _ShowHotelState();
}

class _ShowHotelState extends State<ShowHotel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 400,
        child: Card(
            child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HotelDesc(
                  item1: hotelnames[widget.index],
                  item2: assets[widget.index],
                  item3: hoteldesc[widget.index],
                ),
              ),
            );
          },
          child: Column(
            children: [
              Text(
                hotelnames[widget.index],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 300, child: Image.asset(assets[widget.index])),
            ],
          ),
        )),
      ),
    );
  }
}
