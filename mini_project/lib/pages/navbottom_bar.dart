import 'package:flutter/material.dart';
import 'package:mini_project/models/widgets.dart';
import 'package:mini_project/pages/screens/home_page.dart';
import 'package:mini_project/pages/screens/job_page.dart';
import 'screens/contactus_page.dart';

class NavBottomBar extends StatefulWidget {
  const NavBottomBar({super.key});

  @override
  State<NavBottomBar> createState() => _NavBottomBarState();
}

class _NavBottomBarState extends State<NavBottomBar> {
  int currentIndex = 0;
  final List<Widget> screens = [
    const HomePage(),
    const JobPage(),
    const ContactusPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        drawer: drawer(context),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.orange[50],
            selectedItemColor: Colors.red.withOpacity(0.7),
            unselectedItemColor: Colors.orange[400],
            iconSize: 20,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.work),
                label: 'Job vacancies',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.support_agent),
                label: 'Contact us',
              ),
            ]));
  }
}
