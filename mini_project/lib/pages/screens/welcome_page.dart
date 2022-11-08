import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_project/pages/navbottom_bar.dart';
import 'package:page_transition/page_transition.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.orange.shade700, Colors.yellow.shade700]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to\nJobfinders!",
                  style: GoogleFonts.staatliches(
                      fontSize: 50, color: Colors.white)),
              Lottie.asset("assets/lottie-job.json"),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                      side: const MaterialStatePropertyAll(BorderSide.none),
                      elevation: const MaterialStatePropertyAll(0),
                      backgroundColor: MaterialStatePropertyAll(
                          Colors.white.withOpacity(0.3)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(PageTransition(
                          child: const NavBottomBar(),
                          type: PageTransitionType.fade,
                          duration: const Duration(seconds: 2)));
                    },
                    child: const Text("Get Started!")),
              ),
            ],
          )),
    );
  }
}
