import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key,
      required this.name,
      required this.icon,
      required this.onPressed});

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 40.0,
          ),
          Text(name, style: const TextStyle(fontSize: 15, color: Colors.black))
        ],
      ),
    );
  }
}
