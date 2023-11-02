import 'package:flutter/material.dart';
import 'package:innstantbook/constants/enums.dart';
import 'package:innstantbook/constants/routes.dart';

class HotelDesc extends StatefulWidget {
  final item;

  const HotelDesc({super.key, required this.item});

  @override
  State<HotelDesc> createState() => _HotelDescState();
}

class _HotelDescState extends State<HotelDesc> {
  late var dropdownvalue = NumberOfRooms.one;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              'Description:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text("select number of rooms you want to book",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
            DropdownButton<NumberOfRooms>(
              value: dropdownvalue,
              onChanged: (value) {
                setState(() {
                  dropdownvalue = value!;
                });
              },
              items: const [
                DropdownMenuItem<NumberOfRooms>(
                  value: NumberOfRooms.one,
                  child: Text("1"),
                ),
                DropdownMenuItem<NumberOfRooms>(
                  value: NumberOfRooms.two,
                  child: Text("2"),
                ),
                DropdownMenuItem<NumberOfRooms>(
                  value: NumberOfRooms.three,
                  child: Text("3"),
                )
              ],
            ),
            FloatingActionButton(
              elevation: 5,
              backgroundColor: Colors.purple[300],
              onPressed: () {
                Navigator.of(context).pushNamed(booking);
              },
              child: Text('Confirm Booking'),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/logo.png")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
