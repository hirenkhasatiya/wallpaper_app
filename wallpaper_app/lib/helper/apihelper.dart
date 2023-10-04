import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modal/wallpaper_modal.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String wApi =
      "https://pixabay.com/api/?key=39825232-d9be9a72a80296c31ec31ab94";

  Future<List<Wallpaper>?> getWallpaper({String query = "lion"}) async {
    http.Response response = await http.get(Uri.parse("$wApi&q=$query"));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      List alldata = data['hits'];

      List<Wallpaper> allwallpaper = alldata
          .map(
            (e) => Wallpaper.fromJson(data: e),
          )
          .toList();
      return allwallpaper;
    } else {
      return null;
    }
  }
}
