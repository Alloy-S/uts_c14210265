import 'package:flutter/material.dart';
import 'package:uts_c14210265/BookmarkPage.dart';
import 'package:uts_c14210265/DiscoveryPage.dart';
import 'package:uts_c14210265/ProfilePage.dart';
import 'package:uts_c14210265/TopFoodiePage.dart';
import 'package:uts_c14210265/tab_navigator.dart';
import 'HomePage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;
  List<Widget> screen = const [
    HomePage(),
    DiscoveryPage(),
    BookmarkPage(),
    TopFoodiePage(),
    ProfilePage()
  ];

  // ===== jika mau navbar tidak hilang jika berpindah page =====
  String _currentPage = "Home";

  List<String> pageKeys = [
    "Home",
    "Discover",
    "Bookmark",
    "TopFood",
    "Profile"
  ];

  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys =  {
    "Home": GlobalKey<NavigatorState>(),
    "Discover": GlobalKey<NavigatorState>(),
    "Bookmark": GlobalKey<NavigatorState>(),
    "TopFood": GlobalKey<NavigatorState>(),
    "Profile": GlobalKey<NavigatorState>(),
  };

  void _selectTab(String tabItem, int index) {
    setState(() {
      _currentPage = tabItem;
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator('Home'),
            _buildOffstageNavigator('Discover'),
            _buildOffstageNavigator('Bookmark'),
            _buildOffstageNavigator('TopFood'),
            _buildOffstageNavigator('Profile'),
          ],
          ),
        // body: screen[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          showUnselectedLabels: true,
          // unselectedFontSize: 5.0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amber[300],
          unselectedItemColor: Colors.black,
          onTap: (int newIndex) {
            // setState(() {
            //   _currentIndex = newIndex;
            // });
            _selectTab(pageKeys[newIndex], newIndex);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined), label: 'Discovery'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border), label: 'Bookmark'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_border), label: 'Top Foodie'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(navigatorKey: _navigatorKeys[tabItem]!, tabItem: tabItem),
    );
  }
}
