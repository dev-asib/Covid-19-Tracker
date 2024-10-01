import 'dart:convert';
import 'package:covid_insight/Model/world_covid_states_model.dart';
import 'package:covid_insight/Services/utilities/app_urls.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class WorldCovidStatesServices {
  static Future<WorldCovidStatesModel> getWorldCovidStatesRecord() async {
    try {
      const String url = AppUrls.worldStatesApi;
      final Uri uri = Uri.parse(url);
      final Response response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return WorldCovidStatesModel.fromJson(data);
      } else {
        throw Exception(
            "Failed with status code: ${response.statusCode}\nbody: ${response.body}");
      }
    } catch (e) {
      throw Exception("failed to get data: $e");
    }
  }

  static Future<List<dynamic>> getCountryList() async {
    try {
      final List<dynamic> data;
      const String url = AppUrls.countryList;
      final Uri uri = Uri.parse(url);
      final Response response = await http.get(uri);

      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception(
            "Failed with status code: ${response.statusCode}\nbody: ${response.body}");
      }
    } catch (e) {
      throw Exception("failed to get data: $e");
    }
  }
}
