import 'package:mini_project/models/job_models.dart';
import 'package:mini_project/models/job_services.dart';
import 'package:flutter/material.dart';

class JobProvider with ChangeNotifier {
  List<JobsData> _itemJobs = [];
  List<JobsData> get getitemJobs => _itemJobs;
  // late SharedPrefReview _sharedPrefReview;

  // late DatabaseHelper _databaseHelper;
  // late SharedPreferences registerData;
  bool loading = false;

  // JobProvider() {
  //   _sharedPrefReview = SharedPrefReview();
  // }

  getJobs() async {
    loading = true;
    final response = await JobServices().fetchData();
    _itemJobs = response;
    loading = false;
    notifyListeners();
  }

  // Future<void> getReview() async {
  //   _itemReview = await _sharedPrefReview.getReview();
  //   notifyListeners();
  // }

  

  // Future<bool> saveReview(ReviewModel reviewModel) async {
  //   final result = await _sharedPrefReview.saveReview(reviewModel);
  //   return result;
  // }
}
//   DbManager() {
//     _databaseHelper = DatabaseHelper();
//     getAllReview();
//   }

//   void getAllReview() async {
//     _itemReview = (await _databaseHelper.getReview());
//     notifyListeners();
//   }

//   Future<void> addReview(ReviewModel reviewModel) async {
//     await _databaseHelper.addReview(reviewModel);
//     getAllReview();
//   }

//   Future<ReviewModel> getTaskById(int id) async {
//     return await _databaseHelper.getReviewById(id);
//   }

//   Future<void> inserReview(ReviewModel reviewModel) async {}
// }