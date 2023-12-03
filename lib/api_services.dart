import 'package:dio/dio.dart';
import 'package:posts_api/constants.dart';
import 'package:posts_api/post_model.dart';

class Apiservices {
  static Future<List<postModel>?> getPostsbyDio() async {
    // paese url
    // get data using  http.get(url)
    // check 200 ok
    try {
      // var url = Uri.parse(AppConstants.baseUrl + AppConstants.postsEndPoint);
      var res =
          await Dio().get(AppConstants.baseUrl + AppConstants.postsEndPoint);
      if (res.statusCode == 200) {
        //postModel poste = postModel.fromJson(json.decode(res.body));
        List<postModel> posts =
            ((res.data) as List).map((e) => postModel.fromJson(e)).toList();
        return posts;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return null;
  }
}
