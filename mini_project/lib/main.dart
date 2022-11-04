import 'package:mini_project/pages/navbottom_bar.dart';
import 'package:mini_project/provider/job_provider.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/provider/review_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ReviewProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => JobProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavBottomBar(),
      ),
    );
  }
}
