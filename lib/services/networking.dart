import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);

  final String url;
   Future getData() async {
     Uri uri=Uri.parse(url);
     http.Response response = await http.get(uri);

     if (response.statusCode == 200) {
       String data = response.body;

       var decodedData = jsonDecode(data);
       return decodedData;
     }
     else {
       print(response.statusCode);
     }
   }
}