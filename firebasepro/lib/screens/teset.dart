


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'home.dart';


// class Teset extends StatefulWidget {
  
//   @override
//   _TesetState createState() => _TesetState();
// }

// class _TesetState extends State<Teset> {
//   String name = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Card(
//           child: TextField(
//             decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search), hintText: 'Search...'),
//             onChanged: (val) {
//               setState(() {
//                 name = val;
//               });
//             },
//           ),
//         ),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: (name != "" && name != null)
//             ? FirebaseFirestore.instance
//                 .collection('Flower')
//                 .where("Flowername", arrayContains: name) //searchKeywords
//                 .snapshots()
//             : FirebaseFirestore.instance.collection("Flower").snapshots(),
//         builder: (context, snapshot) {
//           return (snapshot.connectionState == ConnectionState.waiting)
//               ? Center(child: CircularProgressIndicator())
//               : ListView.builder(
//                  itemCount: snapshot.data.docs.length,
//                   itemBuilder: (context, index) {
//                     DocumentSnapshot data = snapshot.data.docs[index];
                     
//                     return Card(
//                       child: Row(
//                         children: <Widget>[
//                           Image.network(
//                             data['img'],
//                             width: 150,
//                             height: 100,
//                             fit: BoxFit.cover,
//                           ),
//                           SizedBox(
//                             width: 25,
//                           ),
//                           Text(
//                             data['name'],
//                             style: TextStyle(
//                               fontWeight: FontWeight.w700,
//                               fontSize: 20,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//         },
//       ),
//     );
//   }

// }