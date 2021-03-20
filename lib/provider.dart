import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:pidjin_app/sharedPreferences.dart';
import 'package:pidjin_app/staffModel.dart';

class StaffProvider {
  Client client = Client();
  Map<String, dynamic> dataTransfer = {};
  StaffProvider({this.dataTransfer});

  Future<StaffModel> fetchStaff() async {
    Map<String, dynamic> mapToWorkWith = {};
    Map<String, dynamic> newData = new Map<String, dynamic>();
    try {
      final response = await client.get("https://gitplussandbox.com/pidgin/");
      newData = json.decode(response.body);
      // print(newData);
      newData.forEach((key, value) {
        if (key == "data") {
          Map<String, dynamic> us = value;
          us.forEach((key, value) {
            mapToWorkWith['$key'] = value;
            // dataTransfer['$key'] = widget.dataTransfer[''];
          });
        }
      });
      if (response.statusCode == 200) {
        // print(response.body);
        final sorted = SplayTreeMap.from(mapToWorkWith,
            (key1, key2) => mapToWorkWith[key2].compareTo(mapToWorkWith[key1]));
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
