import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pidjin_app/checkConnection.dart';
import 'package:pidjin_app/generateStaffBloc.dart';
import 'package:pidjin_app/offlinedata.dart';
import 'package:pidjin_app/staffModel.dart';
import 'package:http/http.dart' as http;

class AddScreenPage extends StatefulWidget {
  @override
  _AddScreenPageState createState() => _AddScreenPageState();
}

class _AddScreenPageState extends State<AddScreenPage> {
  bool _internet = false;
  Map<String, dynamic> comingData = {};

  List staff = [
    "bismark",
    "mike",
    "ben",
    "kwakye",
    "maxwell",
    "kelvin",
    "nana",
    "danny",
    "ambrose",
    "johnny"
  ];
  int currentScore = 0;
  void initState() {
    super.initState();
    checkInternet();
    gitplusStaffBloc.fetchCurrentStaff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _internet
            ? StreamBuilder(
                stream: gitplusStaffBloc.staff,
                initialData: staffOffline == null
                    ? null
                    : StaffModel.fromJson(staffOffline),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return _mainContent(snapshot.data);
                  }
                  return Center(child: CupertinoActivityIndicator(radius: 20));
                })
            : Text("There is no internet")
        // : Center(
        //     child: Container(
        //       child: Text("Please Check your connection"),
        //     ),

        );
  }

  Future<void> checkInternet() async {
    await checkConnection().then((value) => setState(() => _internet = value));
  }

  Widget _mainContent(StaffModel model) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 15),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${staff[0]}"),
                        Text(
                          "${model.data.bismark}",
                          textAlign: TextAlign.center,
                        ),
                        ButtonTheme(
                          minWidth: 40,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                addData(staff[0].toString());
                              },
                              child: Icon(Icons.add, color: Colors.white)),
                        )
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${staff[1]}"),
                        Center(
                            child: Text(
                          "${model.data.mike}",
                          textAlign: TextAlign.center,
                        )),
                        ButtonTheme(
                          minWidth: 40,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                addData(staff[1].toString());
                              },
                              child: Icon(Icons.add, color: Colors.white)),
                        )
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${staff[2]}"),
                        Text(
                          "${model.data.ben}",
                          textAlign: TextAlign.center,
                        ),
                        ButtonTheme(
                          minWidth: 40,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                print(comingData);
                                addData(staff[2].toString());
                              },
                              child: Icon(Icons.add, color: Colors.white)),
                        )
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${staff[3]}"),
                        Text(
                          "${model.data.kwakye}",
                          textAlign: TextAlign.center,
                        ),
                        ButtonTheme(
                          minWidth: 40,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                addData(staff[3].toString());
                              },
                              child: Icon(Icons.add, color: Colors.white)),
                        )
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${staff[4]}"),
                        Text(
                          "${model.data.maxwell}",
                          textAlign: TextAlign.center,
                        ),
                        ButtonTheme(
                          minWidth: 40,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                addData(staff[4].toString());
                              },
                              child: Icon(Icons.add, color: Colors.white)),
                        )
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${staff[5]}"),
                        Text(
                          "${model.data.kelvin}",
                          textAlign: TextAlign.center,
                        ),
                        ButtonTheme(
                          minWidth: 40,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                addData(staff[5].toString());
                              },
                              child: Icon(Icons.add, color: Colors.white)),
                        )
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${staff[6]}"),
                        Text(
                          "${model.data.nana}",
                          textAlign: TextAlign.center,
                        ),
                        ButtonTheme(
                          minWidth: 40,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                addData(staff[6].toString());
                              },
                              child: Icon(Icons.add, color: Colors.white)),
                        )
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${staff[7]}"),
                        Text(
                          "${model.data.danny}",
                          textAlign: TextAlign.center,
                        ),
                        ButtonTheme(
                          minWidth: 40,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                addData(staff[7].toString());
                              },
                              child: Icon(Icons.add, color: Colors.white)),
                        )
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${staff[8]}"),
                        Text(
                          "${model.data.ambrose}",
                          textAlign: TextAlign.center,
                        ),
                        ButtonTheme(
                          minWidth: 40,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                addData(staff[8].toString());
                              },
                              child: Icon(Icons.add, color: Colors.white)),
                        )
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${staff[9]}"),
                        Text(
                          "${model.data.johnny}",
                          textAlign: TextAlign.center,
                        ),
                        ButtonTheme(
                          minWidth: 40,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                addData(staff[9].toString());
                              },
                              child: Icon(Icons.add, color: Colors.white)),
                        )
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: ButtonTheme(
                    minWidth: 40,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        refreshFunction();
                      },
                      child: Row(children: [
                        Text("Refresh"),
                        Icon(Icons.refresh, color: Colors.white)
                      ]),
                    ),
                  ))
                ])),
      ),
    );
  }

  Future addData(
    name,
  ) async {
    String url = "https://gitplussandbox.com/pidgin/";
    getData();
    // print(comingData);
    var newBody = {'name': name};
    // print("$name");
    var sendResponse = await http.post(url, body: newBody);
    if (sendResponse.statusCode == 200) {
      // final dataRes = json.decode(sendResponse.body);
      gitplusStaffBloc.fetchCurrentStaff();
      return;
    }
  }

  refreshFunction() {
    return gitplusStaffBloc.fetchCurrentStaff();
  }

  getData() async {
    Map<String, dynamic> mapToWorkWith = {};
    Map<String, dynamic> newData = new Map<String, dynamic>();
    comingData = Map.from(mapToWorkWith);
    try {
      final response = await http.get("https://gitplussandbox.com/pidgin/");
      newData = json.decode(response.body);
      // print(newData);
      newData.forEach((key, value) {
        if (key == "data") {
          Map<String, dynamic> us = value;
          us.forEach((key, value) {
            mapToWorkWith['$key'] = value;
            comingData['$key'] = value;
            // dataTransfer['$key'] = widget.dataTransfer[''];
          });
        }
      });
      if (response.statusCode == 200) {
        // print(response.body);
        final sorted = SplayTreeMap.from(mapToWorkWith,
            (key1, key2) => mapToWorkWith[key2].compareTo(mapToWorkWith[key1]));
        // print(sorted);
        // print(mapToWorkWith);

        var newResponse = StaffModel.fromJson(json.decode(response.body));
        // print(newResponse);
        // print(newResponse);
        // print(comingData);
        return newResponse;
      } else {
        throw Exception('Failed to load Staff');
      }
    } catch (e) {
      throw Exception('Failed to Staff List');
    }
  }
}
