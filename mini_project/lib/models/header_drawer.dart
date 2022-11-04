import 'package:flutter/material.dart';

class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({Key? key}) : super(key: key);

  @override
  State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[500],
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
    );
  }
}
