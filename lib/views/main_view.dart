import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:innstantbook/constants/enums.dart';
import 'package:innstantbook/constants/routes.dart';
import 'package:innstantbook/main.dart';
import 'package:innstantbook/views/hotel_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  late final destController = TextEditingController();
  late var destination = destController.text;
  late var hotelName;

  List hotelNames = [
    'J.W. Mariot',
    'Taj Hotel',
    'Le Meridian',
    'Westin',
    'Deltin',
  ];
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
        title: const Text('InnstantBook'),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout) {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                      (_) => false,
                    );
                  }
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text('Log out'),
                ),
              ];
            },
          )
        ],
      ),
      body: Card(
        margin: EdgeInsets.all(16),
        elevation: 15,
        child: Column(
          children: [
            Text("Select Your Destination"),
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
            Text(
              destination,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              child: Text(
                'Popular Hotels',
                style: TextStyle(fontSize: 50),
              ),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: hotelNames.length,
                itemBuilder: (context, index) {
                  hotelName = hotelNames[index];
                  return SizedBox(
                    height: 10,
                    width: 150,
                    child: ListTile(
                      title: Text(hotelName),
                      subtitle: Text('Book Now'),
                      onTap: () {
                        hotelName = hotelNames[index];
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HotelDesc(item: hotelName)));
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 300,
            ),
            Card(
                child: Container(
              height: 100,
              child: PageView.builder(
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(child: Text(places[index])),
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
