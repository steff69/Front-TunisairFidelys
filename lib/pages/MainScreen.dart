import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:travel_app/pages/ProfilePage.dart';
import 'package:travel_app/pages/Search.dart';
import 'package:travel_app/pages/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> bottomScreens = [
      HomePage(),
      SearchPage(),
      ProfilePage(),
    ];
    return Scaffold(
      body: Stack(
        children: [
          bottomScreens[index],
          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
                data: Theme.of(context)
                    .copyWith(canvasColor: Color.fromARGB(95, 135, 135, 135)),
                child: BottomNavigationBar(
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  unselectedIconTheme: IconThemeData(color: Colors.black38),
                  selectedIconTheme: IconThemeData(color: Colors.white),
                  onTap: (value) {
                    setState(() {
                      print(value);
                      index = value;
                    });
                  },
                  currentIndex: index,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Ionicons.home_outline),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Ionicons.search),
                      label: "Search",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Ionicons.person_outline),
                      label: "Profile",
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
