import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:innstantbook/constants/enums.dart';
import 'package:innstantbook/constants/routes.dart';
import 'package:innstantbook/utilities/show_logout_dialog.dart';
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
                  break;
                case MenuAction.profile:
                  Navigator.of(context).pushNamed(profilePage);
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text('Log out'),
                ),
                PopupMenuItem<MenuAction>(
                  child: Text('MyProfile'),
                  value: MenuAction.profile,
                )
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
            SizedBox(
              child: Text(
                'Popular Hotels',
                style: TextStyle(fontSize: 30),
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
                      subtitle: Row(
                        children: [
                          Icon(Icons.star),
                          Text('Book Now'),
                        ],
                      ),
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
            // SizedBox(
            //   height: 300,
            // ),
          ],
        ),
      ),
    );
  }
}
