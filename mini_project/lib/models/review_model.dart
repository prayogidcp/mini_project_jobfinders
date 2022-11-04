class ReviewModel {
  late int? id;
  late String name;
  late String email;
  late String suggestion;

  ReviewModel(
      {this.id,
      required this.name,
      required this.email,
      required this.suggestion});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'suggestion': suggestion,
    };
  }

  ReviewModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    email = map["email"];
    suggestion = map["suggestion"];
  }
}
