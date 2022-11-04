

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/models/review_model.dart';
import 'package:mini_project/pages/screens/review_page.dart';
import 'package:mini_project/provider/review_provider.dart';
import 'package:provider/provider.dart';

import '../../models/widgets.dart';

class ContactusPage extends StatefulWidget {
  final ReviewModel? reviewModel;
  const ContactusPage({super.key, this.reviewModel});

  @override
  State<ContactusPage> createState() => _ContactusPageState();
}

class _ContactusPageState extends State<ContactusPage> {
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerSuggestion = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.reviewModel != null) {
      controllerName.text = widget.reviewModel!.name;
      controllerEmail.text = widget.reviewModel!.email;
      controllerSuggestion.text = widget.reviewModel!.suggestion;
    }
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerSuggestion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(context),
        // bottomSheet: buttomSheet(context),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          elevation: 0,
          title: const Text("Contact us - Jobfinders"),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter a valid name!";
                    }
                    return null;
                  },
                  controller: controllerName,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.orange,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Name",
                    hintStyle: const TextStyle(
                      color: Colors.orange,
                    ),
                    labelStyle: const TextStyle(color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Input name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      value != null && !EmailValidator.validate(value)
                          ? 'Enter a valid email'
                          : null,
                  controller: controllerEmail,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.orange,
                    ),
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Colors.orange,
                    ),
                    labelStyle: const TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                    labelText: "Email",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Input email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: controllerSuggestion,
                  maxLines: 5,
                  decoration: InputDecoration(
                    prefixIcon: Container(
                        padding: const EdgeInsets.only(bottom: 85),
                        child: const Icon(
                          Icons.note_add,
                          color: Colors.orange,
                        )),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Suggestion",
                    hintStyle: const TextStyle(
                      color: Colors.orange,
                    ),
                    labelStyle: const TextStyle(color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Input Suggestion",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Nama : ${controllerName.text}"),
                                  Text("Email : ${controllerEmail.text}"),
                                  Text(
                                      "Suggestion : \n${controllerSuggestion.text}"),
                                ],
                              ),
                            ),
                            title: const Center(child: Text("Confirm")),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  final review = ReviewModel(
                                      name: controllerName.text,
                                      email: controllerEmail.text,
                                      suggestion: controllerSuggestion.text);

                                  // reviewProvider.addReview(review);

                                  Provider.of<ReviewProvider>(context,
                                          listen: false)
                                      .addReview(review);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ReviewPage(),
                                      ));
                                  // }
                                },
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
