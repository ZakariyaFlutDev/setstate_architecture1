import 'package:http/http.dart';

class Network{
  static String BASE = "api.github.com";

  static String api = "/users/";
  //+githubID

  static Future<String?> GET(String api, Map<String,dynamic> params) async{
    var url = Uri.https(BASE, api,params);
    var resp =  await get(url);
    if(resp.statusCode == 200){
      return resp.body;
    }
    return null;
  }

  static Map<String,dynamic> paramEmpty(){
    Map<String, dynamic> params = new Map();
    return params;
}
}