import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
saveStringShare({@required String key, @required var data}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, data);
}