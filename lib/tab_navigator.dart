import 'package:flutter/material.dart';
import 'package:uts_c14210265/BookmarkPage.dart';
import 'package:uts_c14210265/DiscoveryPage.dart';
import 'package:uts_c14210265/HomePage.dart';
import 'package:uts_c14210265/ProfilePage.dart';
import 'package:uts_c14210265/TopFoodiePage.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  const TabNavigator(
      {super.key, required this.navigatorKey, required this.tabItem});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    Widget child;
    switch (tabItem) {
      case "Home":
        child = HomePage();
        break;
      case "Discover":
        child = DiscoveryPage();
        break;
      case "Bookmark":
        child = BookmarkPage();
        break;
      case "TopFood":
        child = TopFoodiePage();
        break;
      case "Profile":
        child = ProfilePage();
        break;
      default:
        child = HomePage();
    }

    return Navigator(
      key: key,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );

    // return Container(
    //   child: child,
    // );
  }

  
}
