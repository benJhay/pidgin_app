import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pidjin_app/checkConnection.dart';
import 'package:pidjin_app/generateStaffBloc.dart';
import 'package:pidjin_app/main.dart';
import 'package:pidjin_app/offlinedata.dart';
import 'package:pidjin_app/staffModel.dart';
import 'package:http/http.dart' as http;

class AddScreenPage extends StatefulWidget {
  @override
  _AddScreenPageState createState() => _AddScreenPageState();
}

class _AddScreenPageState extends State<AddScreenPage> {
  bool _internet = false;

  var staff = [];
  var scores = [];
  void initState() {
    super.initState();
    checkInternet();
    getData();
    gitplusStaffBloc.fetchCurrentStaff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.refresh), onPressed: () => MyApp.rebirth(context))
          ],
        ),
        body: _internet
            ? StreamBuilder(
                stream: gitplusStaffBloc.staff,
                initialData: staffOffline == null
                    ? null
                    : StaffModel.fromJson(staffOffline),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(child: _mainContent(snapshot.data));
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
                  for (int data = 0; data < staff.length; data++)
                    Row(
                      children: [
                        Text("${staff[data]}"),
                        Text("${scores[data]}"),
                        ButtonTheme(
                          minWidth: 40,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                print(staff[data]);
                                addData(staff[data].toString());
                              },
                              child: Icon(Icons.add, color: Colors.white)),
                        )
                      ],
                    ),

                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text("${staff[0]}"),
                  //       Text(
                  //         "${staff[1]}",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       ButtonTheme(
                  //         minWidth: 40,
                  //         height: 40,
                  //         child: ElevatedButton(
                  //             onPressed: () {
                  //               addData(staff[0].toString());
                  //             },
                  //             child: Icon(Icons.add, color: Colors.white)),
                  //       )
                  //     ]),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Divider(),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text("${staff[2]}"),
                  //       Center(
                  //           child: Text(
                  //         "${staff[3]}",
                  //         textAlign: TextAlign.center,
                  //       )),
                  //       ButtonTheme(
                  //         minWidth: 40,
                  //         height: 40,
                  //         child: ElevatedButton(
                  //             onPressed: () {
                  //               addData(staff[2].toString());
                  //             },
                  //             child: Icon(Icons.add, color: Colors.white)),
                  //       )
                  //     ]),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Divider(),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text("${staff[4]}"),
                  //       Text(
                  //         "${staff[5]}",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       ButtonTheme(
                  //         minWidth: 40,
                  //         height: 40,
                  //         child: ElevatedButton(
                  //             onPressed: () {
                  //               addData(staff[4].toString());
                  //             },
                  //             child: Icon(Icons.add, color: Colors.white)),
                  //       )
                  //     ]),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Divider(),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text("${staff[6]}"),
                  //       Text(
                  //         "${staff[7]}",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       ButtonTheme(
                  //         minWidth: 40,
                  //         height: 40,
                  //         child: ElevatedButton(
                  //             onPressed: () {
                  //               addData(staff[6].toString());
                  //             },
                  //             child: Icon(Icons.add, color: Colors.white)),
                  //       )
                  //     ]),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Divider(),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text("${staff[8]}"),
                  //       Text(
                  //         "${staff[9]}",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       ButtonTheme(
                  //         minWidth: 40,
                  //         height: 40,
                  //         child: ElevatedButton(
                  //             onPressed: () {
                  //               addData(staff[8].toString());
                  //             },
                  //             child: Icon(Icons.add, color: Colors.white)),
                  //       )
                  //     ]),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Divider(),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text("${staff[10]}"),
                  //       Text(
                  //         "${staff[11]}",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       ButtonTheme(
                  //         minWidth: 40,
                  //         height: 40,
                  //         child: ElevatedButton(
                  //             onPressed: () {
                  //               addData(staff[10].toString());
                  //             },
                  //             child: Icon(Icons.add, color: Colors.white)),
                  //       )
                  //     ]),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Divider(),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text("${staff[12]}"),
                  //       Text(
                  //         "${staff[13]}",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       ButtonTheme(
                  //         minWidth: 40,
                  //         height: 40,
                  //         child: ElevatedButton(
                  //             onPressed: () {
                  //               addData(staff[12].toString());
                  //             },
                  //             child: Icon(Icons.add, color: Colors.white)),
                  //       )
                  //     ]),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Divider(),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text("${staff[14]}"),
                  //       Text(
                  //         "${staff[15]}",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       ButtonTheme(
                  //         minWidth: 40,
                  //         height: 40,
                  //         child: ElevatedButton(
                  //             onPressed: () {
                  //               addData(staff[14].toString());
                  //               refreshFunction();
                  //             },
                  //             child: Icon(Icons.add, color: Colors.white)),
                  //       )
                  //     ]),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Divider(),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text("${staff[16]}"),
                  //       Text(
                  //         "${staff[17]}",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       ButtonTheme(
                  //         minWidth: 40,
                  //         height: 40,
                  //         child: ElevatedButton(
                  //             onPressed: () {
                  //               addData(staff[16].toString());
                  //             },
                  //             child: Icon(Icons.add, color: Colors.white)),
                  //       )
                  //     ]),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Divider(),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text("${staff[18]}"),
                  //       Text(
                  //         "${staff[19]}",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       ButtonTheme(
                  //         minWidth: 40,
                  //         height: 40,
                  //         child: ElevatedButton(
                  //             onPressed: () {
                  //               addData(staff[18].toString());
                  //             },
                  //             child: Icon(Icons.add, color: Colors.white)),
                  //       )
                  //     ]),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Divider(),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Center(
                  //     child: ButtonTheme(
                  //   minWidth: 40,
                  //   height: 40,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       refreshFunction();
                  //     },
                  //     child: Row(children: [
                  //       Text("Refresh"),
                  //       Icon(Icons.refresh, color: Colors.white)
                  //     ]),
                  //   ),
                  // ))
                ])),
      ),
    );
  }
  Future update(){
    
  }

  Future addData(
    name,
  ) async {
    String url = "https://gitplussandbox.com/pidgin/";

    var newBody = {'name': name};

    var sendResponse = await http.post(url, body: newBody);
    if (sendResponse.statusCode == 200) {
      print(json.decode(sendResponse.body));
      getData();
      return;
    }
  }

  refreshFunction() async {
    gitplusStaffBloc.dispose();
    return gitplusStaffBloc.staff;
  }

  getData() async {
    Map<String, dynamic> newData = new Map<String, dynamic>();

    try {
      final response = await http.get("https://gitplussandbox.com/pidgin/");
      newData = json.decode(response.body);
      // print(newData);
      newData.forEach((key, value) {
        if (key == "data") {
          Map<String, dynamic> us = value;
          us.forEach((key, value) {
            staff += [key];
            scores += [value];
          });
        }
      });
      if (response.statusCode == 200) {
        print(response.body);

        var newResponse = StaffModel.fromJson(json.decode(response.body));

        return newResponse;
      } else {
        throw Exception('Failed to load Staff');
      }
    } catch (e) {
      throw Exception('Failed to Staff List');
    }
  }
}
