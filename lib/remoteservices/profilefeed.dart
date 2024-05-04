import 'dart:convert';
import 'dart:math';


import 'package:http/http.dart' as http;
import 'package:talent_frontend/models/feed.dart';

class RemoteService
{
  Future<List<Homemap>?> getprofilefeed(username) async
  {
    var client = http.Client();

    var uri = Uri.parse('http://192.168.24.185:8000/home/all-items/?name=Akira+Kurasowa&posts=');
    var response = await client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      );
      if (response.statusCode == 200)
    {
      var json = response.body;
      print("======================================================");
      print(json);
      print("======================================================");

      return homemapFromJson(json);
      
    }
    else{
      print("======================================================");
      print("\n\n\n\n\n\n\n\n\n\n\n");
      print(response.statusCode);
      print(response.body);
    }
  }
}