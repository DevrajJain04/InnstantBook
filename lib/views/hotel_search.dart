import 'package:flutter/material.dart';
import 'package:innstantbook/utilities/showHotel.dart';

class HotelSearch extends StatefulWidget {
  const HotelSearch({super.key});

  @override
  State<HotelSearch> createState() => _HotelSearchState();
}

class _HotelSearchState extends State<HotelSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Luxurious Hotels And Inns"),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      'In Your City !!',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          SizedBox(
            child: Card(
              elevation: 0.0,
              child: Text(
                'Top Recommended Hotels ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (context, index) {
                return showHotel(index: index);
              },
            ),
          )
        ],
      ),
    );
  }
}