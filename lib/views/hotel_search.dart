import 'package:flutter/material.dart';
import 'package:innstantbook/constants/hotel_list.dart';
import 'package:innstantbook/utilities/show_hotel.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    label: Text('Enter Your City'),
                    border: OutlineInputBorder(
                        gapPadding: 5, borderRadius: BorderRadius.circular(8))),
              ),
            ),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              child: Card(
                elevation: 0.0,
                child: Text(
                  'Top Recommended Hotels ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotels.length,
                itemBuilder: (context, index) {
                  return ShowHotel(index: index);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
