import 'package:flutter/material.dart';
import 'package:innstantbook/constants/hotel_list.dart';
import 'package:innstantbook/utilities/fetch_data.dart';
import 'package:innstantbook/views/hotel_detail_view.dart';

class ShowHotel extends StatefulWidget {
  final int index;
  const ShowHotel({super.key, required this.index});

  @override
  State<ShowHotel> createState() => _ShowHotelState();
}

class _ShowHotelState extends State<ShowHotel> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

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
                  name: hotels[widget.index]['name'],
                  image: assets[widget.index],
                  description: hoteldesc[widget.index],
                ),
              ),
            );
          },
          child: Column(
            children: [
              Text(
                hotels[widget.index]['name'],
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
