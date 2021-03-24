
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:pidjin_app/sharedPreferences.dart';
import 'package:pidjin_app/staffModel.dart';

class StaffProvider {
  Client client = Client();
  
  Future<StaffModel> fetchStaff() async {
    try {
      final response = await client.get("https://gitplussandbox.com/pidgin/");
      var newData = json.decode(response.body);
      // print(newData);
      // print(StaffModel(data: newData));
      if (response.statusCode == 200) {
        // print(response.body);

        // print(sorted);

        saveStringShare(
            key: "allstaff", data: json.encode(json.decode(response.body)));
        var newResponse = StaffModel.fromJson(json.decode(response.body));
        // print(newResponse);
        // print(newResponse);
        return newResponse;
      } else {
        throw Exception('Failed to load Staff');
      }
    } catch (e) {
      throw Exception('Failed to Staff List');
    }
  }
}
