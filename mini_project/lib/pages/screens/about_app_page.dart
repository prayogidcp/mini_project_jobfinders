import 'package:flutter/material.dart';
import 'package:mini_project/models/widgets.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text("About - Jobfinders"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/logo.png",
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Jobfinders",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
                "Jobfinders merupakan Aplikasi Lowongan Kerja (Job Portal) berbasis Android hadir sejak 2022 yang berfokus dibidang rekrutmen untuk mempermudah pencarian pekerjaan dan perekrutan karyawan")
          ],
        ),
      ),
    );
  }
}
