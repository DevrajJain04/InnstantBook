import 'package:flutter/material.dart';
import 'package:innstantbook/views/hotel_search.dart';
import 'package:innstantbook/views/explore.dart';
import 'package:innstantbook/views/profile_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;
  final routes = [HotelSearch(),ExplorePage(),ProfilePageView(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: routes[currentPageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.purple[400],
        ),
        child: NavigationBar(
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
