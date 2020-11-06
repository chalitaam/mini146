import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebasepro/screens/ead.dart';
import 'package:firebasepro/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {

TextEditingController _namecontroller = TextEditingController();
  TextEditingController _pricecontroller = TextEditingController();
  TextEditingController _typecontroller = TextEditingController();

  // ignore: unused_field
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }





  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มรายการภาพยนต์'),
      ),
      body: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
          children: [
            Container(
              
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        chooseImage();
                      },
                      child: Text('เลือกรูปภาพ'),
                      shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.green[200],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              height: 100,
              child: _image == null
                  ? Text('ไม่ได้อัพโหลดรูปภาพ')
                  : Image.file(_image),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "ชื่อ"),
                  controller: _namecontroller,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "ปีที่ฉาย"),
                  controller: _pricecontroller,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "ประภท"),
                  controller: _typecontroller,
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                add(
                );
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
                                child: Text("ต้องการบันทึกข้อมูลหรือไม่"),
                              ),
                            ],
                          ),
                          actions: [
                            FlatButton(
                                child: Text('ยกเลิก'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                            FlatButton(
                                child: Text('ตกลง'),
                                onPressed: () {
                                  MaterialPageRoute route = MaterialPageRoute(
                                    builder: (context) => Homepage(),
                                  );
                                  Add();
                                  Navigator.push(context, route);
                                })
                          ],
                        );
                      });
              },
              //ปุ่ม button บันทึกการแก้ไขข้อมูล
              child: Text('เพิ่มข้อมูล'),
              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.green[200],
              
            ),
            
            
          ],
        ),
      ),
    );
  }

  Future<void> add(
    //  String bn,
    //  String bt,
    //  int p,
    //  String i,
  ) async {
    String fileName = Path.basename(_image.path);
    StorageReference reference =
    FirebaseStorage.instance.ref().child('$fileName');
    StorageUploadTask storageUploadTask = reference.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then((value) async {
      await FirebaseFirestore.instance.collection("Flower").add({
        'Flowername': _namecontroller.text,
        'type':_typecontroller.text ,
        'price': int.parse(_pricecontroller.text), 
        'img': value,
      });
    });
  }

  Future<void> chooseImage() async {
    // ignore: non_constant_identifier_names
    final PickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (PickedFile != null) {
        _image = File(PickedFile.path);
      } else {
        print('ยังไม่ได้อัพโหลดรูปภาพ');
      }
      
    });
  }


}