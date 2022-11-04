import '../models/job_models.dart';
import 'package:dio/dio.dart';

class JobServices {
  final Dio dio = Dio();
  bool loading = false;

  Future fetchData() async {
    loading = true;
    final Response response =
        await dio.get("https://www.arbeitnow.com/api/job-board-api");
    if (response.statusCode == 200) {
      List dataJob = (response.data["data"] as List)
          .map((e) => JobsData.fromJson(e))
          .toList();
      loading = false;
      return dataJob;
    }
  }
}
