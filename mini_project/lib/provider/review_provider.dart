import 'package:mini_project/helper/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/models/review_model.dart';

class ReviewProvider with ChangeNotifier {
  List<ReviewModel> _itemReview = [];
  List<ReviewModel> get getitemReview => _itemReview;
  late DatabaseHelper _dbHelper;
  bool loading = false;

  ReviewProvider() {
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
}
