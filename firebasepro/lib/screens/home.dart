import 'package:firebasepro/screens/add.dart';
import 'package:firebasepro/screens/authen.dart';
import 'package:firebasepro/screens/teset.dart';
import 'package:flutter/material.dart';
import 'Manage.dart';
import 'authen.dart';
import 'login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String user;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.login,
              color: Colors.white,
            ),
            
            
            onPressed: () => googleSignOut().whenComplete(() {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                  (route) => false);
              {
                // do something
              }
            }),
          )
          
        ],
        title: Text("Movie"),
      ),
      // appBar: AppBar(
      //   title: Text("Homepage"),
      // ),
      body: Container(
        decoration: BoxDecoration(
          image : DecorationImage(
            image:AssetImage("img/M.png"),
            fit: BoxFit.cover,

             ),
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top:30),),
            RaisedButton(
              onPressed: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => Add(),
                );
                Navigator.push(context, route);
              },
              
              child: Text("เพิ่มรายการภาพยนต์"),
              
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.grey[200],
            ),

            // FloatingActionButton(
            //     onPressed: () {
            //       MaterialPageRoute route = MaterialPageRoute(
            //         builder: (context) => Teset(),
            //       );
            //       Navigator.push(context, route);
            //     },
            //     child: Icon(Icons.search)),
            realTimeFood(),
          ],
        ),
      ),

      
    );
  }

  Widget realTimeFood() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Flower").snapshots(),
      builder: (context, snapshots) {
        switch (snapshots.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
            break;
          default:
            return Column(
              children: makeListWidget(snapshots),
            );
        }
      },
    );
  }

  List<Widget> makeListWidget(AsyncSnapshot snapshots) {
    return snapshots.data.docs.map<Widget>((document) {
      return Card(
        
        child: ListTile(
          leading: Container(
              // decoration: BoxDecoration(
              //    color: Colors.red,
              //     borderRadius:
              //                            BorderRadius.all(Radius.circular(7.0)),
              //                        boxShadow: [
              //                          BoxShadow(blurRadius: 1.0, color: Colors.black)
              //                        ],

              // ),
              width: 100,
              child: Image.network(
                document['img'],
                fit: BoxFit.cover,
              )),
          title: Text(document['Flowername']),
          subtitle: Text(document['type']),
          trailing: IconButton(
              //--------trailing คือ เพิ่มข้างหลัง เพื่อไว้ใส่ icon ลบ
              icon: Icon(Icons.delete),
              color: Colors.red,
              //----------ปุ่มลบ-----------
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text("ต้องการลบข้อมูลหรือไม่!!"),
                            )
                          ],
                        ),
                        actions: [
                          FlatButton(
                              child: Text("ลบ"),
                              color: Colors.red,
                              onPressed: () {
                                deleteButton(
                                    document.id); //-------ใส่ document id
                                Navigator.of(context).pop();
                              }),
                          FlatButton(
                              child: Text("ยกเลิก"),
                              color: Colors.green,
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ],
                      );
                    });
              }),
          onTap: () {
            MaterialPageRoute route = MaterialPageRoute(
              builder: (context) => Manage(docid: document.id),
            );
            Navigator.push(context, route);
          },
        ),
      );
    }).toList();
  }

  Future<void> deleteButton(id) async {
    await FirebaseFirestore.instance.collection('Flower').doc(id).delete();
  }
}

// import 'dart:html';

// import 'package:firebasepro/screens/authen.dart';
// import 'package:firebasepro/screens/strory.dart';
// import 'package:flutter/material.dart';
// import 'authen.dart';
// import 'login.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Homepage extends StatefulWidget {
//   @override
//   _HomepageState createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   // TextEditingController _controller1;
//   // TextEditingController _controller2;
//   // TextEditingController _controller3;
//   // TextEditingController _controller4;
//    @override
//   void initState() {
//     super.initState();
//     // _controller1 = TextEditingController(text: dispen1);
//     // _controller2 = TextEditingController(text: dispen2);
//     // _controller3 = TextEditingController(text: dispen3);
//      getChanelInfo();
//           getChanelInfo(chanel: "ch1");
//           getChanelInfo(chanel: "ch2");
//          // getChannelInfo(chanel: "ch3");
//        }

//       @override
//        Widget build(BuildContext context) {
//          return Scaffold(
//  appBar: AppBar(
//    actions: <Widget>[
//      IconButton(
//        icon: Icon(
//          Icons.login,
//          color: Colors.white,
//        ),
//        onPressed: () => googleSignOut().whenComplete(() {
//          Navigator.of(context).pushAndRemoveUntil(
//              MaterialPageRoute(
//                builder: (context) => Login(),
//              ),
//              (route) => false);
//          {
//            // do something
//          }
//        }),
//      )
//    ],
//    title: Text("cannon"),
//  ),
//            body: SingleChildScrollView(
//              child: Container(
//                height: 900,
//                color: Colors.blue[50],
//                child: Column(
//                  children: [
//                    Padding(
//                      padding: EdgeInsets.only(top: 30),
//                    ),
//                    Center(
//                      child: Card(
//                        child: Column(
//                          mainAxisSize: MainAxisSize.min,
//                          children: <Widget>[
//                            Padding(
//                              padding: EdgeInsets.all(10.0),
//                              child: GestureDetector(
//                                onTap: () {},
//                                child: Container(
//                                  width: 100.0,
//                                  height: 100.0,
//                                  child: Image.network(
//                                    document['img'],
//                                     fit: BoxFit.cover,
//                                  ),

//                                  decoration: BoxDecoration(

//                                    color: Colors.red,
//                                    image: DecorationImage(

//                                        image: AssetImage('img/w.jpg'),
//                                        fit: BoxFit.cover),
//                                    borderRadius:
//                                        BorderRadius.all(Radius.circular(7.0)),
//                                    boxShadow: [
//                                      BoxShadow(blurRadius: 1.0, color: Colors.black)
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            ),
//                            Container(
//                              child: TextField(
//                                controller: _controller1,
//                                decoration: InputDecoration(
//                                  labelText: "ชื่อดอกไม้",
//                                  hintText: "ป้อนชื่อดอกไม้",
//                                  enabledBorder: OutlineInputBorder(
//                                    borderSide: BorderSide(color: Colors.green[200]),
//                                  ),
//                                  focusedBorder: OutlineInputBorder(
//                                    borderSide: BorderSide(
//                                      color: Colors.black,
//                                    ),
//                                  ),
//                                ),
//                              ),
//                              width: 250,
//                              padding: EdgeInsets.all(16),
//                            ),
//                            Container(
//                              child: TextField(
//                                controller: _controller2,
//                                decoration: InputDecoration(
//                                  labelText: "ราคาดอกไม้",
//                                  hintText: "ป้อนราคาดอกไม้",
//                                  enabledBorder: OutlineInputBorder(
//                                    borderSide: BorderSide(color: Colors.green[200]),
//                                  ),
//                                  focusedBorder: OutlineInputBorder(
//                                    borderSide: BorderSide(
//                                      color: Colors.black,
//                                    ),
//                                  ),
//                                ),
//                              ),
//                              width: 250,
//                              padding: EdgeInsets.all(16),
//                            ),
//                            Row(
//                              mainAxisAlignment: MainAxisAlignment.end,
//                              children: <Widget>[
//                                RaisedButton(
//                                  child: Text("แก้ไข"),
//                                  shape: RoundedRectangleBorder(
//                                      borderRadius: BorderRadius.circular(20)),
//                                  color: Colors.green[200],
//                                  onPressed: () {
//                                    Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) =>
//                                              Strory(chanel: "ch1")),
//                                    );
//                                  },
//                                ),
//                                const SizedBox(width: 8),
//                                RaisedButton(
//                                  child: const Text("บันทึก"),
//                                  shape: RoundedRectangleBorder(
//                                      borderRadius: BorderRadius.circular(20)),
//                                  color: Colors.green[200],
//                                  onPressed: () {
//                                    showDialog(
//                                        context: context,
//                                        barrierDismissible: false,
//                                        builder: (BuildContext context) {
//                                          return AlertDialog(
//                                            title: Center(),
//                                            content: Row(
//                                              mainAxisAlignment:
//                                                  MainAxisAlignment.center,
//                                              crossAxisAlignment:
//                                                  CrossAxisAlignment.center,
//                                              children: <Widget>[
//                                                Expanded(
//                                                  child: Text(
//                                                      "ต้องการบันทึกข้อมูลหรือไม่"),
//                                                ),
//                                              ],
//                                            ),
//                                            actions: [
//                                              FlatButton(
//                                                  child: Text('ยกเลิก'),
//                                                  onPressed: () {
//                                                    Navigator.of(context).pop();
//                                                  }),
//                                              FlatButton(
//                                                  child: Text('ตกลง'),
//                                                  onPressed: () {
//                                                    saveButton(chanel: "ch1");
//                                                    // _inputTextController.clear();
//                                                    Navigator.of(context).pop();
//                                                  })
//                                            ],
//                                          );
//                                        });
//                                  },
//                                ),
//                                const SizedBox(width: 8),
//                              ],
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                    Center(
//                      child: Card(
//                        child: Column(
//                          mainAxisSize: MainAxisSize.min,
//                          children: <Widget>[
//                            Padding(
//                              padding: EdgeInsets.all(10.0),
//                              child: GestureDetector(
//                                onTap: () {},
//                                child: Container(
//                                  width: 100.0,
//                                  height: 100.0,
//                                  decoration: BoxDecoration(
//                                    color: Colors.red,
//                                    image: DecorationImage(
//                                        image: AssetImage('img/w.jpg'),
//                                        fit: BoxFit.cover),
//                                    borderRadius:
//                                        BorderRadius.all(Radius.circular(7.0)),
//                                    boxShadow: [
//                                      BoxShadow(blurRadius: 1.0, color: Colors.black)
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            ),
//                            Container(
//                              child: TextField(
//                                controller: _controller1,
//                                decoration: InputDecoration(
//                                  labelText: "ชื่อดอกไม้",
//                                  hintText: "ป้อนชื่อดอกไม้",
//                                  enabledBorder: OutlineInputBorder(
//                                    borderSide: BorderSide(color: Colors.green[200]),
//                                  ),
//                                  focusedBorder: OutlineInputBorder(
//                                    borderSide: BorderSide(
//                                      color: Colors.black,
//                                    ),
//                                  ),
//                                ),
//                              ),
//                              width: 250,
//                              padding: EdgeInsets.all(16),
//                            ),
//                            Container(
//                              child: TextField(
//                                controller: _controller2,
//                                decoration: InputDecoration(
//                                  labelText: "ราคาดอกไม้",
//                                  hintText: "ป้อนราคาดอกไม้",
//                                  enabledBorder: OutlineInputBorder(
//                                    borderSide: BorderSide(color: Colors.green[200]),
//                                  ),
//                                  focusedBorder: OutlineInputBorder(
//                                    borderSide: BorderSide(
//                                      color: Colors.black,
//                                    ),
//                                  ),
//                                ),
//                              ),
//                              width: 250,
//                              padding: EdgeInsets.all(16),
//                            ),
//                             Row(
//                              mainAxisAlignment: MainAxisAlignment.end,
//                              children: <Widget>[
//                                RaisedButton(
//                                  child: Text("แก้ไข"),
//                                  shape: RoundedRectangleBorder(
//                                      borderRadius: BorderRadius.circular(20)),
//                                  color: Colors.green[200],
//                                  onPressed: () {
//                                    Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) =>
//                                              Strory(chanel: "ch2")),
//                                    );
//                                  },
//                                ),
//                                const SizedBox(width: 8),
//                                RaisedButton(
//                                  child: const Text("บันทึก"),
//                                  shape: RoundedRectangleBorder(
//                                      borderRadius: BorderRadius.circular(20)),
//                                  color: Colors.green[200],
//                                  onPressed: () {
//                                    showDialog(
//                                        context: context,
//                                        barrierDismissible: false,
//                                        builder: (BuildContext context) {
//                                          return AlertDialog(
//                                            title: Center(),
//                                            content: Row(
//                                              mainAxisAlignment:
//                                                  MainAxisAlignment.center,
//                                              crossAxisAlignment:
//                                                  CrossAxisAlignment.center,
//                                              children: <Widget>[
//                                                Expanded(
//                                                  child: Text(
//                                                      "ต้องการบันทึกข้อมูลหรือไม่"),
//                                                ),
//                                              ],
//                                            ),
//                                            actions: [
//                                              FlatButton(
//                                                  child: Text('ยกเลิก'),
//                                                  onPressed: () {
//                                                    Navigator.of(context).pop();
//                                                  }),
//                                              FlatButton(
//                                                  child: Text('ตกลง'),
//                                                  onPressed: () {
//                                                    saveButton(chanel: "ch1");
//                                                    // _inputTextController.clear();
//                                                    Navigator.of(context).pop();
//                                                  })
//                                            ],
//                                          );
//                                        });
//                                  },
//                                ),
//                                const SizedBox(width: 8),
//                              ],
//                            ),
//                          ],
//                        ),

//                      ),
//                    ),

//                    // Center(

//                    //   child: Card(

//                    //     color: Colors.blue[50],
//                    //     elevation: 10,

//                    //     child: Row(

//                    //       children: <Widget>[
//                    //         Padding(
//                    //           padding: EdgeInsets.all(10.0),
//                    //           child: GestureDetector(
//                    //             onTap: () {},
//                    //             child: Container(

//                    //               width: 100.0,
//                    //               height: 100.0,
//                    //               decoration: BoxDecoration(
//                    //                 color: Colors.red,
//                    //                 image: DecorationImage(
//                    //                     image: AssetImage('img/w.jpg'),
//                    //                     fit: BoxFit.cover),
//                    //                 borderRadius:
//                    //                     BorderRadius.all(Radius.circular(7.0)),
//                    //                 boxShadow: [
//                    //                   BoxShadow(blurRadius: 1.0, color: Colors.black)
//                    //                 ],
//                    //               ),

//                    //             ),
//                    //           ),
//                    //         ),
//                    //         GestureDetector(
//                    //           child: RaisedButton(
//                    //             child: const Text("ดอกทิวหลิบ"),
//                    //               shape: RoundedRectangleBorder(
//                    //                   borderRadius: BorderRadius.circular(20)),
//                    //               color: Colors.green[200],
//                    //             onPressed: () {
//                    //                Navigator.push(
//                    //                   context,
//                    //                   MaterialPageRoute(
//                    //                       builder: (context) => Strory(chanel: "ch1")),
//                    //                 );

//                    //            },

//                    //           ),
//                    //           // onTap: () {
//                    //           //   return showDialog<void>(
//                    //           //     context: context,
//                    //           //     barrierDismissible: false,
//                    //           //     builder: (BuildContext conext) {
//                    //           //       return AlertDialog(
//                    //           //         title: Text('Not in stock'),
//                    //           //         content: const Text(
//                    //           //             'This item is no longer available'),
//                    //           //         actions: <Widget>[
//                    //           //           FlatButton(
//                    //           //             child: Text('Ok'),
//                    //           //             onPressed: () {
//                    //           //               Navigator.of(context).pop();
//                    //           //             },
//                    //           //           ),
//                    //           //         ],
//                    //           //       );
//                    //           //     },
//                    //           //   );
//                    //           // },
//                    //           // child: Container(
//                    //           //     padding: EdgeInsets.all(30.0),
//                    //           //     child: Chip(
//                    //           //       label: Text('ดอกทิวหลิบ'),
//                    //           //       shadowColor: Colors.blue,
//                    //           //       backgroundColor: Colors.green,
//                    //           //       elevation: 10,
//                    //           //       autofocus: true,
//                    //           //     )),
//                    //         ),
//                    //       ],
//                    //     ),
//                    //   ),
//                    // ),

//                    //  Center(
//                    //   child: Card(
//                    //     color: Colors.blue[50],
//                    //     elevation: 10,
//                    //     child: Row(
//                    //       children: <Widget>[
//                    //         Padding(
//                    //           padding: EdgeInsets.all(10.0),
//                    //           child: GestureDetector(
//                    //             onTap: () {

//                    //             },
//                    //             child: Container(
//                    //               width: 100.0,
//                    //               height: 100.0,
//                    //               decoration: BoxDecoration(
//                    //                 color: Colors.red,
//                    //                 image: DecorationImage(
//                    //                     image: AssetImage('img/S.jpg'),
//                    //                     fit: BoxFit.cover),
//                    //                 borderRadius:
//                    //                     BorderRadius.all(Radius.circular(7.0)),
//                    //                 boxShadow: [
//                    //                   BoxShadow(blurRadius: 1.0, color: Colors.black)
//                    //                 ],
//                    //               ),
//                    //             ),
//                    //           ),
//                    //         ),
//                    //         GestureDetector(
//                    //           child: RaisedButton(
//                    //             child: const Text("ดอกกุหลาบ"),
//                    //               shape: RoundedRectangleBorder(
//                    //                   borderRadius: BorderRadius.circular(20)),
//                    //               color: Colors.green[200],
//                    //             onPressed: () {
//                    //                Navigator.push(
//                    //                   context,
//                    //                   MaterialPageRoute(
//                    //                       builder: (context) => Strory(chanel: "ch2")),
//                    //                 );

//                    //            },

//                    //           ),
//                    //           // onTap: () {
//                    //           //   return showDialog<void>(
//                    //           //     context: context,
//                    //           //     barrierDismissible: false,
//                    //           //     builder: (BuildContext conext) {
//                    //           //       return AlertDialog(
//                    //           //         title: Text('Not in stock'),
//                    //           //         content: const Text(
//                    //           //             'This item is no longer available'),
//                    //           //         actions: <Widget>[
//                    //           //           FlatButton(
//                    //           //             child: Text('Ok'),
//                    //           //             onPressed: () {
//                    //           //               Navigator.of(context).pop();
//                    //           //             },
//                    //           //           ),
//                    //           //         ],
//                    //           //       );
//                    //           //     },
//                    //           //   );
//                    //           // },
//                    //           // child: Container(
//                    //           //     padding: EdgeInsets.all(30.0),
//                    //           //     child: Chip(
//                    //           //       label: Text('ดอกกุหลาบ'),
//                    //           //       shadowColor: Colors.blue,
//                    //           //       backgroundColor: Colors.green,
//                    //           //       elevation: 10,
//                    //           //       autofocus: true,
//                    //           //     )),
//                    //         ),
//                    //       ],
//                    //     ),
//                    //   ),
//                    // ),
//                  ],
//                ),
//              ),
//            ),
//          );
//        }

//        Future<void> saveButton({String chanel}) async {
//          if (chanel == 'ch1') {
//            await FirebaseFirestore.instance.collection('Title').doc('ch1').update({
//              'Titiestro': _controller1.text,
//              'price': _controller2.text,
//            }).then((value) {});
//          } else if (chanel == 'ch2') {
//            await FirebaseFirestore.instance.collection('Title').doc('ch2').update({
//              'Titiestro': _controller3.text,
//              'price': _controller4.text,
//            }).then((value) {});
//          }
//        }

//        Future<void> getChanelInfo({String chanel}) async {
//     await FirebaseFirestore.instance
//         .collection('Title')
//         .snapshots();
//     //     .then((value) {
//     //   setState(() {
//     //     if (chanel == "ch1") {
//     //       _controller1 = TextEditingController(text: value.data()['Titiestro']);
//     //       _controller2 = TextEditingController(text: value.data()['price']);
//     //     }else if (chanel == "ch2") {
//     //       _controller3 = TextEditingController(text: value.data()['Titiestro']);
//     //       _controller4 = TextEditingController(text: value.data()['price']);
//     //     }
//     //   });
//     // });
//   }
// }

// // body: new ListView.builder(
// //          padding: const EdgeInsets.all(16),
// //         itemBuilder: (context, i){
// //           return Container(
// //             height: 130,
// //             child: Card(
// //                 color: Colors.blue[50],
// //               elevation: 10,
// //               child: Row(
// //                 children: <Widget>[
// //                    Padding(
// //                      padding: EdgeInsets.all(10.0),
// //                     child: GestureDetector(
// //                       onTap: () {

// //                       },
// //                       child: Container(
// //                         width: 100.0,
// //                         height: 100.0,
// //                         decoration: BoxDecoration(
// //                           color: Colors.red,
// //                             image: DecorationImage(
// //                               image:  AssetImage('images/hacker.jpeg'),
// //                               fit: BoxFit.cover),
// //                                borderRadius:
// //                                 BorderRadius.all(Radius.circular(7.0)),
// //                                  boxShadow: [
// //                               BoxShadow(blurRadius: 1.0, color: Colors.black)
// //                             ], ),

// //                       ),

// //                     ),

// //                    ),
// //                    GestureDetector(
// //                                          onTap: () {
// //                       return showDialog<void>(
// //                         context: context,
// //                           barrierDismissible: false,
// //                           builder: (BuildContext conext) {
// //                           return AlertDialog(
// //                             title: Text('Not in stock'),
// //                             content:
// //                                 const Text('This item is no longer available'),
// //                             actions: <Widget>[
// //                               FlatButton(
// //                                 child: Text('Ok'),
// //                                 onPressed: () {
// //                                   Navigator.of(context).pop();
// //                                 },
// //                               ),
// //                             ],
// //                           );
// //                         },
// //                       );
// //                     },
// //                      child: Container(
// //                         padding: EdgeInsets.all(30.0),
// //                         child: Chip(
// //                           label: Text('@anonymous'),
// //                           shadowColor: Colors.blue,
// //                           backgroundColor: Colors.green,
// //                           elevation: 10,
// //                           autofocus: true,
// //                         )),
// //                    ),

// //                 ],
// //               ),

// //             ),

// //           );
// //         }

// //       ),

// //    body: SingleChildScrollView(
// //      child: Container(
// //          height: 900,
// //           color: Colors.blue[50],
// //            child: Column(
// //              children: [

// //    Center(

// //      child: Card(

// //        child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: <Widget> [
// //             const ListTile(

// //           leading: Icon(Icons.devices_rounded),

// //           title: Text('EOS 850D EF-S18-55mm f/4-5.6 IS STM'),
// //           subtitle: Text('ความละเอียด 24.1 ล้านพิกเซล มาพร้อมระบบเซนเซอร์ APS-C CMOS และการบันทึกวิดีโอระดับ 4K'),

// //         ),
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.end,
// //           children: <Widget>[
// //             // TextButton(
// //             //   child: const Text('อ่านต่อ'),
// //             //   onPressed: () {/* ... */},
// //             // ),
// //                const SizedBox(width: 8),
// //                TextButton(
// //               child: const Text('เลือกดูสินค้า'),
// //               onPressed: () {
// //                 Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (context) => Strory(chanel: "ch1")),
// //                           );
// //               },

// //             ),
// //              const SizedBox(width: 8),

// //           ],
// //         ),

// //           ],
// //      ),

// //    ),
// //    ),
// //    Center(

// //      child: Card(

// //        child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: <Widget> [

// //             const ListTile(

// //           leading: Icon(Icons.devices_rounded),

// //           title: Text('EOS-1D X Mark III'),
// //           subtitle: Text('เซนเซอร์ CMOS 20.1MP และระบบการประมวลผลภาพ DIGIC X ถ่ายภาพต่อเนื่องในโหมด AF/AE tracking ได้มากถึง16 ภาพต่อวินาที'),

// //         ),
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.end,
// //           children: <Widget>[
// //             // TextButton(
// //             //   child: const Text('อ่านต่อ'),
// //             //   onPressed: () {/* ... */},
// //             // ),
// //                const SizedBox(width: 8),
// //                TextButton(
// //               child: const Text('เลือกดูสินค้า'),
// //               onPressed: () {
// //                 Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (context) => Strory(chanel: "ch2")),
// //                           );
// //               },

// //             ),
// //              const SizedBox(width: 8),
// //           ],
// //         ),

// //           ],
// //      ),

// //    ),
// //    ),
// //              ],

// //      )

// // ),
// // ),

// //  body: SingleChildScrollView(
// //    child: Container(
// //      height: 900,
// //   color: Colors.blue[50],
// //   child: Column(
// //     children: [
// //       Center(
// //         child: Card(
// //           shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadiusDirectional.circular(20)),
// //     clipBehavior: Clip.antiAlias,
// //     child: Image.asset(
// //       "img/ff.png",
// //       width: double.maxFinite,

// //     ),

// //           // child: Column(
// //           //   mainAxisSize: MainAxisSize.min,
// //           //   children: <Widget> [
// //           //     const ListTile(
// //           //       leading: Icon(Icons.arrow_right),
// //           //       title: Text('ช่อง1'),

// //           //     ),
// //           //   ],
// //           // ),
// //         ),
// //       )
// //     ],
// //   ),
// //    ),

// //  ),
// //   Card(
// //    shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadiusDirectional.circular(20)),
// //     clipBehavior: Clip.antiAlias,
// //     child: Image.asset(
// //       "img/ff.png",
// //       width: double.maxFinite,
// //     ),

// //  ),
