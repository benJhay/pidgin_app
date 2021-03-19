import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> staffOffline;
Future<void> loadAllStaffOffline() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey("allstaff")) {
    String encodeData = prefs.getString("allstaff");
    // print(encodeData);
    Map<String, dynamic> decodeData = json.decode(encodeData);
    staffOffline = decodeData;
  } else
    staffOffline = null;
}
