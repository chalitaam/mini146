// import 'package:firebasepro/screens/ead.dart';
// import 'package:flutter/material.dart';
// import 'ead.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Strory extends StatefulWidget {
//   final String chanel;
//    const Strory({Key key, this.chanel}) : super(key: key);
//   @override
//   _StroryState createState() => _StroryState();
// }

// class _StroryState extends State<Strory> {
//   TextEditingController _controller1;
//   TextEditingController _controller2;
//   TextEditingController _controller3;
//   TextEditingController _controller4;
//   @override
//   void initState() {
//     super.initState();
//     // _controller1 = TextEditingController(text: dispen1);
//     // _controller2 = TextEditingController(text: dispen2);
//     // _controller3 = TextEditingController(text: dispen3);
//     //  getChanelInfo();
//     //  getChanelInfo(chanel: "ch1");
//     //  getChanelInfo(chanel: "ch2");
//     // getChannelInfo(chanel: "ch3");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ดูสินค้า"),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           height: 900,
//           color: Colors.blue[50],
//           child: Column(
            
//             children: [
//                ListTile(
//         leading: Icon(Icons.map,color: Colors.lightBlue,),
//         title: Text("ช่อง ${widget.chanel}"),
//       ),
//               Padding(
//                 padding: EdgeInsets.only(top: 30),
//               ),
//               Center(
//                 child: Card(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children:  <Widget> [
//                       Padding(
//                         padding: EdgeInsets.all(10.0),
//                         child: GestureDetector(
//                           onTap: () {},
//                           child: Container(
                           
//                             width: 100.0,
//                             height: 100.0,
//                             decoration: BoxDecoration(
//                               color: Colors.red,
//                               image: DecorationImage(
//                                   image: AssetImage('img/w.jpg'),
//                                   fit: BoxFit.cover),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(7.0)),
//                               boxShadow: [
//                                 BoxShadow(blurRadius: 1.0, color: Colors.black)
//                               ],
//                             ),
                            
//                           ),
//                         ),
//                       ),
//                     Container(
                      
//                       child: TextField(
//                         controller: _controller1,

//                           decoration: InputDecoration(
//                             labelText: "ชื่อดอกไม้",
//                             hintText: "ป้อนชื่อดอกไม้",
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.green[200]),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                       ),
//                       width: 250,
//                         padding: EdgeInsets.all(16),

//                     ),
//                      Container(
//                       child: TextField(
//                         controller: _controller2,

//                           decoration: InputDecoration(
//                             labelText: "ราคาดอกไม้",
//                             hintText: "ป้อนราคาดอกไม้",
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.green[200]),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                       ),
//                       width: 250,
//                         padding: EdgeInsets.all(16),

//                     ),
                   
                    

//                     ],
//                   ),
//                 ),

//               ),
//               // Center(
//               //   child: TextField(
//               //     controller: _controller1,
                  
//               //     decoration: InputDecoration(
//               //       labelText: "ชื่อรุ่น",
//               //       hintText: "ป้อนชื่อรุ่น",
//               //       enabledBorder: OutlineInputBorder(
//               //         borderSide: BorderSide(color: Colors.green[200]),
//               //       ),
//               //       focusedBorder: OutlineInputBorder(
//               //         borderSide: BorderSide(
//               //           color: Colors.black,
//               //         ),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               // Column(
//               //   children: [
//               //     Padding(
//               //       padding: EdgeInsets.only(top: 30),
//               //     ),
//               //     Center(
//               //       child: TextField(
//               //         controller: _controller2,
                      
//               //         decoration: InputDecoration(
//               //           labelText: "ราคา",
//               //           hintText: "ป้อนราคา",
//               //           enabledBorder: OutlineInputBorder(
//               //             borderSide: BorderSide(color: Colors.green[200]),
//               //           ),
//               //           focusedBorder: OutlineInputBorder(
//               //             borderSide: BorderSide(
//               //               color: Colors.black,
//               //             ),
//               //           ),
//               //         ),
//               //       ),
//               //     ),
//               //     RaisedButton(
//               //       child: const Text("บันทึก"),
//               //       shape: RoundedRectangleBorder(
//               //           borderRadius: BorderRadius.circular(20)),
//               //       color: Colors.green[200],
//               //       onPressed: () {
//               //         showDialog(
//               //             context: context,
//               //             barrierDismissible: false,
//               //             builder: (BuildContext context) {
//               //               return AlertDialog(
//               //                 title: Center(),
//               //                 content: Row(
//               //                   mainAxisAlignment: MainAxisAlignment.center,
//               //                   crossAxisAlignment: CrossAxisAlignment.center,
//               //                   children: <Widget>[
//               //                     Expanded(
//               //                       child: Text("ต้องการบันทึกข้อมูลหรือไม่"),
//               //                     ),
//               //                   ],
//               //                 ),
//               //                 actions: [
//               //                   FlatButton(
//               //                       child: Text('ยกเลิก'),
//               //                       onPressed: () {
//               //                         Navigator.of(context).pop();
//               //                       }),
//               //                   FlatButton(
//               //                       child: Text('ตกลง'),
//               //                       onPressed: () {
//               //                         saveButton(chanel: "ch1");
//               //                         // _inputTextController.clear();
//               //                         Navigator.of(context).pop();
//               //                       })
//               //                 ],
//               //               );
//               //             });
//               //       },
//               //     ),
//               //     const SizedBox(width: 8),
//               //   ],
//               // ),


//               // Center(
//               //   child: TextField(
//               //     controller: _controller3,
                 
//               //     decoration: InputDecoration(
//               //       labelText: "ชื่อรุ่น",
//               //       hintText: "ป้อนชื่อรุ่น",
//               //       enabledBorder: OutlineInputBorder(
//               //         borderSide: BorderSide(color: Colors.green[200]),
//               //       ),
//               //       focusedBorder: OutlineInputBorder(
//               //         borderSide: BorderSide(
//               //           color: Colors.black,
//               //         ),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               //  Column(
//               //   children: [
//               //     Padding(
//               //       padding: EdgeInsets.only(top: 30),
//               //     ),
//               //     Center(
//               //       child: TextField(
//               //         controller: _controller4,
                      
//               //         decoration: InputDecoration(
//               //           labelText: "ราคา",
//               //           hintText: "ป้อนราคา",
//               //           enabledBorder: OutlineInputBorder(
//               //             borderSide: BorderSide(color: Colors.green[200]),
//               //           ),
//               //           focusedBorder: OutlineInputBorder(
//               //             borderSide: BorderSide(
//               //               color: Colors.black,
//               //             ),
//               //           ),
//               //         ),
//               //       ),
//               //     ),
//               //     RaisedButton(
//               //       child: const Text("บันทึก"),
//               //       shape: RoundedRectangleBorder(
//               //           borderRadius: BorderRadius.circular(20)),
//               //       color: Colors.green[200],
//               //       onPressed: () {
//               //         showDialog(
//               //             context: context,
//               //             barrierDismissible: false,
//               //             builder: (BuildContext context) {
//               //               return AlertDialog(
//               //                 title: Center(),
//               //                 content: Row(
//               //                   mainAxisAlignment: MainAxisAlignment.center,
//               //                   crossAxisAlignment: CrossAxisAlignment.center,
//               //                   children: <Widget>[
//               //                     Expanded(
//               //                       child: Text("ต้องการบันทึกข้อมูลหรือไม่"),
//               //                     ),
//               //                   ],
//               //                 ),
//               //                 actions: [
//               //                   FlatButton(
//               //                       child: Text('ยกเลิก'),
//               //                       onPressed: () {
//               //                         Navigator.of(context).pop();
//               //                       }),
//               //                   FlatButton(
//               //                       child: Text('ตกลง'),
//               //                       onPressed: () {
//               //                         saveButton(chanel: "ch2");
//               //                         // _inputTextController.clear();
//               //                         Navigator.of(context).pop();
//               //                       })
//               //                 ],
//               //               );
//               //             });
//               //       },
//               //     ),
//               //     const SizedBox(width: 8),
//               //   ],
//               // ),

//             ],
            
//           ),
//         ),
//       ),
//     );
//   }

//   // Future<void> getChanelInfo({String chanel}) async {
//   //   await FirebaseFirestore.instance
//   //       .collection('Title')
//   //       .doc(chanel)
//   //       .get()
//   //       .then((value) {
//   //     setState(() {
//   //       if (chanel == "ch1") {
//   //         _controller1 = TextEditingController(text: value.data()['Titiestro']);
//   //         _controller2 = TextEditingController(text: value.data()['price']);
//   //       }else if (chanel == "ch2") {
//   //         _controller3 = TextEditingController(text: value.data()['Titiestro']);
//   //         _controller4 = TextEditingController(text: value.data()['price']);
//   //       }
//   //     });
//   //   });
//   // }

//   // Future<void> saveButton({String chanel}) async {
//   //   if (chanel == 'ch1') {
//   //     await FirebaseFirestore.instance
//   //     .collection('Title')
//   //     .doc('ch1').update({
//   //       'Titiestro': _controller1.text,
//   //       'price': _controller2.text,
//   //     }).then((value) {});
//   //   }else if (chanel == 'ch2') {
//   //     await FirebaseFirestore.instance
//   //     .collection('Title')
//   //     .doc('ch2').update({
//   //       'Titiestro': _controller3.text,
//   //       'price': _controller4.text,
//   //     }).then((value) {});
//   //   }
//   // }
// }
