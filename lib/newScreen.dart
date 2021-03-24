// import 'package:flutter/material.dart';
// import 'package:pidjin_app/staffModel.dart';

// class NewScreen extends StatefulWidget {
//   @override
//   _NewScreenState createState() => _NewScreenState();
// }

// class _NewScreenState extends State<NewScreen> {
//   bool tt = true;
//   Future<StaffModel> futureStaff;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     futureStaff = fetchStaff();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: tt
//             ? FutureBuilder<StaffModel>(
//                 future: futureStaff,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.connectionState == ConnectionState.done) {
//                     if (snapshot.hasData) {
//                       return Center(
//                           child: Container(
//                               child: Text("${snapshot.data.data[0]}")));
//                     } else if (snapshot.connectionState ==
//                         ConnectionState.none) {
//                       throw Exception("Error loading data");
//                     }
//                   }
//                   return Center(
//                     child: Container(
//                       child: Text("meeeee"),
//                     ),
//                   );
//                 },
//               )
//             : Text("Couldnt display any data"));
//   }
// }
