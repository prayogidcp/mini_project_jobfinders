import 'package:mini_project/pages/screens/about_app_page.dart';
import 'package:mini_project/pages/navbottom_bar.dart';

import '../pages/screens/contactus_page.dart';
import 'package:flutter/material.dart';

import '../pages/screens/home_page.dart';
import '../pages/screens/job_page.dart';
import '../pages/screens/review_page.dart';

class MyWidgetApps extends StatefulWidget {
  const MyWidgetApps({super.key});

  @override
  State<MyWidgetApps> createState() => _MyWidgetAppsState();
}

class _MyWidgetAppsState extends State<MyWidgetApps> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget drawer(BuildContext context) {
  return Container(
    color: Colors.white,
    width: MediaQuery.of(context).size.width / 2,
    child: Column(
      children: [
        Container(
          color: Colors.orange[500],
          height: 200,
          width: double.infinity,
          child: Column(children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              height: 120,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("assets/logo.png"))),
            ),
            const Text(
              "Jobfinders",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "info@jobfinders.com",
              style: TextStyle(color: Colors.grey[200], fontSize: 14),
            ),
          ]),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavBottomBar(),
                    ));
              },
              selectedColor: Colors.black.withOpacity(0.7),
              selected: true,
              leading: const Icon(Icons.dashboard),
              title: const Text(
                "Home",
                style: TextStyle(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReviewPage(),
                    ));
              },
              selectedColor: Colors.black.withOpacity(0.7),
              selected: true,
              leading: const Icon(Icons.reviews),
              title: const Text(
                "Review",
                style: TextStyle(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutAppPage(),
                    ));
              },
              selectedColor: Colors.black.withOpacity(0.7),
              selected: true,
              leading: const Icon(Icons.info),
              title: const Text(
                "About",
                style: TextStyle(),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

PreferredSizeWidget widgetappBar() {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.orange,
    elevation: 0,
    title: const Text("Home Page - Jobfinders"),
  );
}

Widget buttomSheet(BuildContext context) {
  return SizedBox(
    height: 50.0,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            child: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JobPage(),
                      ));
                },
                icon: const Icon(Icons.work_rounded),
                color: Colors.orange),
          ),
          SizedBox(
            child: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                },
                icon: const Icon(Icons.home_filled),
                color: Colors.orange),
          ),
          SizedBox(
            child: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContactusPage(),
                      ));
                },
                icon: const Icon(Icons.support_agent),
                color: Colors.orange),
          ),
        ],
      ),
    ),
  );
}
