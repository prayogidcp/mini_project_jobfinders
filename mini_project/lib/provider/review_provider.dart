import 'package:mini_project/helper/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/models/review_model.dart';

class ReviewProvider with ChangeNotifier {
  List<ReviewModel> _itemReview = [];
  List<ReviewModel> get getitemReview => _itemReview;
  // late SharedPrefReview _sharedPrefReview;
  late DatabaseHelper _dbHelper;
  bool loading = false;

  ReviewProvider() {
    // _sharedPrefReview = SharedPrefReview();
    _dbHelper = DatabaseHelper();
    _getAllReview();
  }

  void _getAllReview() async {
    loading = true;
    _itemReview = await _dbHelper.getReview();
    loading = false;
    notifyListeners();
  }

  Future<void> addReview(ReviewModel reviewModel) async {
    await _dbHelper.insertReview(reviewModel);
    _getAllReview();
  }

  Future<ReviewModel> getNoteById(int id) async {
    return await _dbHelper.getReviewById(id);
  }

    void deleteReview(int id) async {
    await _dbHelper.deleteReview(id);
    _getAllReview();
  }

  // addReview2(ReviewModel reviewModel) async {
  //   _itemReview.add(reviewModel);
  //   final result = await _sharedPrefReview.saveReview(reviewModel);
  //   return result;
  //   // notifyListeners();
  // }

  // getReview() async {
  //   _itemReview = await _sharedPrefReview.getReview();
  //   notifyListeners();
  // }

  // Future<bool> saveReview(ReviewModel reviewModel) async {
  //   _itemReview.add(reviewModel);
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