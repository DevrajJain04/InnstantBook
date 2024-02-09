import 'package:flutter/material.dart';
import 'package:innstantbook/constants/enums.dart';
import 'package:innstantbook/views/hotel_search.dart';
import 'package:innstantbook/views/explore.dart';
import 'package:innstantbook/views/profile_page.dart';
import 'package:innstantbook/views/search_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  PageController pc = PageController(initialPage: 1);
  final routes = [
    const SearchPage(),
    const HotelSearch(),
    const ExplorePage(),
    ProfilePageView(),
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        children: routes,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue[200],
        ),
        child: NavigationBar(
          elevation: 10,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
            NavigationDestination(icon: Icon(Icons.hotel), label: 'Hotels'),
            NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
          selectedIndex: currentPageIndex,
          onDestinationSelected: (index) {
            pc.animateToPage(
              index,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeIn,
            );
          },
        ),
      ),
    );
  }
}
