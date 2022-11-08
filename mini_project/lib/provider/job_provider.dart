import 'package:mini_project/models/job_models.dart';
import 'package:mini_project/models/job_services.dart';
import 'package:flutter/material.dart';

class JobProvider with ChangeNotifier {
  List<JobsData> _itemJobs = [];
  List<JobsData> get getitemJobs => _itemJobs;
  bool loading = false;

  getJobs() async {
    loading = true;
    final response = await JobServices().fetchData();
    _itemJobs = response;
    loading = false;
    notifyListeners();
  }
}
