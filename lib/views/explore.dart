import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:innstantbook/constants/enums.dart';
import 'package:innstantbook/constants/hotel_list.dart';
import 'package:innstantbook/constants/routes.dart';
import 'package:innstantbook/utilities/show_logout_dialog.dart';
import 'package:innstantbook/views/hotel_detail_view.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'InnstantBook',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).initState();
            setState(() {
              currentPageIndex = 0;
            });
          },
        ),
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
          itemCount: hotels.length,
          itemBuilder: (context, index) {
            var hotelThumbnail =
                hotels[index]['photo']['images']['thumbnail']['url'];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(image: CachedNetworkImageProvider(hotelThumbnail),),
              ),
              title: Text(hotels[index]['name']),
              subtitle: const Row(
                children: [
                  Icon(Icons.star),
                  Text('Book Now'),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HotelDesc(
                          name: hotels[index]['name'],
                          image: hotels[index]['photo']['images']['large']
                              ['url'],
                          description: hotels[index]['description'],
                        )));
              },
            );
          },
        ),
      ),
    );
  }
}
