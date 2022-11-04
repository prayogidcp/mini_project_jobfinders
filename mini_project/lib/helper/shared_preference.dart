// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// import '../models/review_model.dart';

// class SharedPrefReview {
//   final String _id = 'id';
//   final String _name = 'name';
//   final String _email = 'email';
//   final String _suggestion = 'password';

//   Future getReview() {
//     return Future(() async {
//       final storage = await SharedPreferences.getInstance();
//       final id = storage.getString(_id);
//       final name = storage.getString(_name);
//       final email = storage.getString(_email);
//       final suggestion = storage.getString(_suggestion);
//       if (id != null && name != null && email != null && suggestion != null) {
//         return ReviewModel(
//             id: id, name: name, email: email, suggestion: suggestion);
//       }
//       return null;
//     });
//   }

//   Future<bool> saveReview(ReviewModel reviewModel) async {
//     final store = await SharedPreferences.getInstance();
//     final id = await store.setString(_id, reviewModel.id);
//     final name = await store.setString(_name, reviewModel.name);
//     final email = await store.setString(_email, reviewModel.email);
//     final suggestion =
//         await store.setString(_suggestion, reviewModel.suggestion);
//     if (id && name && email && suggestion) return true;
//     return false;
//   }
// }
