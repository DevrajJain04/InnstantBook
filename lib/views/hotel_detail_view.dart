import 'package:flutter/material.dart';
import 'package:innstantbook/constants/enums.dart';
import 'package:innstantbook/constants/routes.dart';
import 'package:innstantbook/utilities/fetch_data.dart';

class HotelDesc extends StatefulWidget {
  final String name, image, description, price;

  const HotelDesc(
      {super.key,
      required this.name,
      required this.image,
      required this.description,
      required this.price});

  @override
  State<HotelDesc> createState() => _HotelDescState();
}

class _HotelDescState extends State<HotelDesc> {
  late var dropdownvalue = NumberOfRooms.one;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  bool readLines = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              child: SizedBox(
                height: 200,
                child: Image.network(widget.image),
              ),
            ),
            Card(
              elevation: 5,
              child: Wrap(children: [
                Text(
                  'Description:\n \t ${widget.description}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  maxLines: readLines ? 12 : 5,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    child: Text(readLines ? "Read Less" : "Read More"),
                    onTap: () {
                      setState(() {
                        readLines = !readLines;
                      });
                    },
                  ),
                )
              ]),
            ),
            Card(
              elevation: 5,
              child: Row(
                children: [
                  const Text(
                    'Enter number of rooms to book:\t',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownButton<NumberOfRooms>(
                    padding: const EdgeInsets.all(8),
                    borderRadius: BorderRadius.circular(10),
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
            Card(
              elevation: 5,
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Price:\n \t ${widget.price}',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
