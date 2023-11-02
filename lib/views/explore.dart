import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:innstantbook/constants/enums.dart';
import 'package:innstantbook/constants/routes.dart';
import 'package:innstantbook/utilities/show_logout_dialog.dart';
import 'package:innstantbook/views/hotel_detail_view.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  late var hotelName;

  List hotelNames = [
    'J.W. Mariot',
    'Taj Hotel',
    'Le Meridian',
    'Westin',
    'Deltin',
    ''
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
                  value: MenuAction.profile,
                  child: Text('MyProfile'),
                )
              ];
            },
          )
        ],
      ),
      body: Card(
        margin: EdgeInsets.all(16),
        elevation: 10,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: hotelNames.length,
          itemBuilder: (context, index) {
            hotelName = hotelNames[index];
            return ListTile(
              title: Text(hotelName),
              subtitle: Row(
                children: const [
                  Icon(Icons.star),
                  Text('Book Now'),
                  
                ],
              ),
              onTap: () {
                hotelName = hotelNames[index];
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HotelDesc(item: hotelName)));
              },
            );
          },
        ),
      ),
    );
  }
}
