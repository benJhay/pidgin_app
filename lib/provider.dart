import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:pidjin_app/sharedPreferences.dart';
import 'package:pidjin_app/staffModel.dart';

class StaffProvider {
  Client client = Client();

  Future<StaffModel> fetchStaff() async {

    // try {
      final response = await client.get("https://gitplussandbox.com/pidgin/");
       print(response.body);
      if (response.statusCode == 200) {
         print(response.body);
        saveStringShare(
        key: "allstaff", data: json.encode(json.decode(response.body)));
        return StaffModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load Staff');
      }
    // } catch (e) {
    //   throw Exception('Failed to Staff List');
    // }
  }
}
