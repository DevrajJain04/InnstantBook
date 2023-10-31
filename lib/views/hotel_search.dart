import 'package:flutter/material.dart';

class HotelSearch extends StatefulWidget {
  const HotelSearch({super.key});

  @override
  State<HotelSearch> createState() => _HotelSearchState();
}

class _HotelSearchState extends State<HotelSearch> {
  late final destController = TextEditingController();
  late var destination = destController.text;

  List places = [
    'Mumbai',
    'Delhi',
    'Ahmedabad',
    'Pune',
    'Bangalore',
    'Chennai'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Luxurious Hotels And Inns"),
      ),
      body: Column(
        children: [
          Text(
            "Select Your Destination",
            style: TextStyle(fontSize: 24),
          ),
          TextField(
            controller: destController,
            decoration: InputDecoration(hintText: "Enter City,State,Country"),
            onChanged: (value) {
              setState(() {
                destination = value;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            child: Text('Go to $destination'),
            onPressed: () {},
          ),
          Card(
              child: Container(
            height: 100,
            child: PageView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromRGBO(201, 132, 238, 0),
                  child: Center(
                      child: Text(
                    places[index],
                    style: TextStyle(color: Colors.purple),
                  )),
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
