import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:khm_app/model/iot_data.dart';


class ApiService {
  Future<IotData> fetchIotData() async {
    final response = await http.get(
      Uri.parse("https://api.khmengineers.in/api/data"),
      headers: {"x-api-key": "KHM123"},
    );

    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return IotData.fromJson(jsonBody);
    } else {
      throw Exception("API Error: ${response.statusCode}");
    }
  }
}
