import 'dart:convert';
import 'package:http/http.dart' as http;

const apikey = "9F753688-5914-4BE0-AB33-E3B2E4FC2E8A";

class Network {
  String url;
  var data;
  Network(this.url);

  Future<dynamic> getdata() async {
    var link = Uri.parse("$url?apikey=$apikey");
    print(link);
    http.Response response = await http.get(link);
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      //print(data);
      return data;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
