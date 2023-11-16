import 'package:flutter/material.dart';
import 'package:innstantbook/constants/enums.dart';
import 'package:innstantbook/utilities/fetch_data.dart';
import 'package:innstantbook/views/hotel_search.dart';
import 'package:innstantbook/views/explore.dart';
import 'package:innstantbook/views/profile_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  final routes = [
    const HotelSearch(),
    const ExplorePage(),
    ProfilePageView(),
  ];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: routes[currentPageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue[200],
        ),
        child: NavigationBar(
          elevation: 10,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.hotel), label: 'hotels'),
            NavigationDestination(icon: Icon(Icons.explore), label: 'explore'),
            NavigationDestination(icon: Icon(Icons.person), label: 'profile'),
          ],
          selectedIndex: currentPageIndex,
          onDestinationSelected: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
      ),
    );
  }
}
