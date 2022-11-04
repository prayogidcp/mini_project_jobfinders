import 'package:flutter/material.dart';
import 'package:mini_project/models/widgets.dart';
import 'package:mini_project/pages/screens/contactus_page.dart';
import 'package:mini_project/provider/review_provider.dart';
import 'package:provider/provider.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  // final DatabaseHelper db = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.orange,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactusPage(),
                ));
          },
        ),
        drawer: drawer(context),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          elevation: 0,
          title: const Text("Review - Jobfinders"),
        ),
        body: Consumer<ReviewProvider>(
          builder: (context, value, child) {
            final reviewItems = value.getitemReview;
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10.0,
                  );
                },
                itemCount: reviewItems.length,
                itemBuilder: (context, index) {
                  final itemReview = reviewItems[index];
                  return ListTile(
                      trailing: IconButton(
                          onPressed: () {
                            value.deleteReview(itemReview.id!);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                      tileColor: Colors.yellow[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      subtitle: Card(
                        color: Colors.orange,
                        elevation: 0,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 5, left: 5, bottom: 5),
                          child: Text(
                            itemReview.suggestion,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      title: Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            "${itemReview.name} (${itemReview.email})",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )));
                });
          },
        ));
  }
}
