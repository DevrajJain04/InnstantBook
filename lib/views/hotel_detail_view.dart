import 'package:flutter/material.dart';
import 'package:innstantbook/constants/enums.dart';
import 'package:innstantbook/constants/routes.dart';

class HotelDesc extends StatefulWidget {
  final item1, item2, item3;

  const HotelDesc(
      {super.key,
      required this.item1,
      required this.item2,
      required this.item3});

  @override
  State<HotelDesc> createState() => _HotelDescState();
}

class _HotelDescState extends State<HotelDesc> {
  late var dropdownvalue = NumberOfRooms.one;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item1),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Image.asset(widget.item2),
          ),
          Card(
            elevation: 5,
            child: Text(
              'Description:\n \t ${widget.item3}',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const Text("select number of rooms you want to book",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )),
          Row(
            children: [
              const Text('Enter number of rooms to book',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
              DropdownButton<NumberOfRooms>(
                enableFeedback: true,
                isDense: false,
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
            ],
          ),
          FloatingActionButton(
            mini: false,
            elevation: 5,
            backgroundColor: Colors.purple[300],
            onPressed: () {
              Navigator.of(context).pushNamed(booking);
            },
            child: const Text('Book'),
          ),
        ],
      ),
    );
  }
}
