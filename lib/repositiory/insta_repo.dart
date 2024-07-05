import 'dart:convert';

import 'package:instagram_rapid_api/consonents/consonents.dart';

import '../model/model.dart';
import 'package:http/http.dart' as http;

class InstaRepoApi {

  Future<InstagramApiModelClass> fatchInstaData() async {
    try {
      final response = await http.get(Uri.parse(Consonents().baseUrl+ Consonents().endPoint),
      headers: {
        'x-rapidapi-host': 'instagram-scraper-api2.p.rapidapi.com',
        'x-rapidapi-key': 'b79aa2a999msh482b42c63f9dcddp179726jsnfbdaf7ea6586',
      });
      print(response.body);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return InstagramApiModelClass.fromJson(body);
      } else {
        throw Exception('Failed load data');
      }
    } catch (e) {
      throw Exception('Error fatching data');
    }
  }
}
