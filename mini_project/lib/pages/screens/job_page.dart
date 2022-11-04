import 'package:badges/badges.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:translator/translator.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/widgets.dart';
import '../../provider/job_provider.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key});

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<JobProvider>(context, listen: false).getJobs();
    final jobProvider = Provider.of<JobProvider>(context);

    return Scaffold(
      // bottomSheet: buttomSheet(context),
      drawer: drawer(context),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text("Job Page - Jobfinders"),
      ),
      body: Container(
        child: jobProvider.loading == true && jobProvider.getitemJobs.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: jobProvider.getitemJobs.length,
                itemBuilder: (context, index) {
                  final items = jobProvider.getitemJobs[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(items.name.toString())
                      Card(
                        elevation: 0,
                        color: Colors.yellow[100],
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              "${items.title}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                          subtitle: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                    elevation: 0,
                                    color: Colors.red.withOpacity(0.7),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5, bottom: 2),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.apartment,
                                                size: 15,
                                                color: Colors.black54,
                                              ),
                                              Text(
                                                "${items.companyName}, ${items.location}",
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 128, 35, 28),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(children: [
                                      items.tags!.isEmpty
                                          ? Badge(
                                              elevation: 0,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              shape: BadgeShape.square,
                                              badgeContent:
                                                  const Text("No Tags"))
                                          : Badge(
                                              elevation: 0,
                                              badgeColor: Colors.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              shape: BadgeShape.square,
                                              badgeContent:
                                                  Text(items.tags![0]),
                                            ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      items.tags!.length <= 1
                                          ? const Text("")
                                          : Badge(
                                              elevation: 0,
                                              badgeColor: Colors.orange,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              shape: BadgeShape.square,
                                              badgeContent:
                                                  Text(items.tags![1]),
                                            ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      items.tags!.length <= 2
                                          ? const Text("")
                                          : Badge(
                                              elevation: 0,
                                              badgeColor: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              shape: BadgeShape.square,
                                              badgeContent:
                                                  Text(items.tags![2]),
                                            ),
                                      items.tags!.length <= 3
                                          ? const Text("")
                                          : Badge(
                                              elevation: 0,
                                              badgeColor: Colors.pink,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              shape: BadgeShape.square,
                                              badgeContent:
                                                  Text(items.tags![3]),
                                            ),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      items.tags!.length <= 4
                                          ? const Text("")
                                          : Badge(
                                              elevation: 0,
                                              badgeColor: Colors.deepOrange,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              shape: BadgeShape.square,
                                              badgeContent:
                                                  Text(items.tags![4]),
                                            )
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          dense: true,
                          leading: const Icon(Icons.work),
                          iconColor: Colors.orange,
                          trailing: InkWell(
                              onTap: () async {
                                var translateItem = items.description;
                                await showDialog<void>(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            const Padding(
                                              padding: EdgeInsets.only(left: 6),
                                              child: Text(
                                                "Description",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Html(
                                              data: translateItem,
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey[600],
                                          ),
                                          onPressed: () {
                                            setState(() async {
                                              final translated =
                                                  await translateItem!
                                                      .translate(
                                                          from: 'de', to: 'en');
                                              translateItem = translated.text;

                                              await showDialog<void>(
                                                context: context,
                                                barrierDismissible: true,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    content:
                                                        SingleChildScrollView(
                                                      child: ListBody(
                                                        children: <Widget>[
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 6),
                                                            child: Text(
                                                              "Description",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20),
                                                            ),
                                                          ),
                                                          Html(
                                                            data: translateItem,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors.grey[600],
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            const Text("Close"),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            });
                                          },
                                          child: const Text("Translate"),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey[600],
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Close"),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                          ),
                                          onPressed: () {
                                            Future<void>? launched;
                                            final Uri toLaunch = Uri(
                                                scheme: 'https',
                                                host: 'www.arbeitnow.com',
                                                path: "view/${items.slug}");
                                            setState(() {
                                              launched =
                                                  _launchInBrowser(toLaunch);
                                            });
                                          },
                                          child: const Text("Apply"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Icon(Icons.arrow_forward)),
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
