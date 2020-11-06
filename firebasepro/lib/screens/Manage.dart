import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Manage extends StatefulWidget {
  final String docid;
  const Manage({Key key, this.docid}) : super(key: key);

  @override
  _ManageState createState() => _ManageState();
}

class _ManageState extends State<Manage> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _pricecontroller = TextEditingController();
  TextEditingController _typecontroller = TextEditingController();


  @override

  void initState(){
     super.initState();
    getInfo();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขข้อมูล'),
        
      ),
      body: 
      Column(
        children: [
          Padding(padding: EdgeInsets.only(top:30),),
          Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
             child: Text ("บันทึก"),
             shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.green[200],
            onPressed: () {
            update(
            );    
          }
          ),
                ],),
            ),
          ),
        
        

        ],
      ),
    );
  }

Future<void> getInfo() async {
    await FirebaseFirestore.instance
        .collection("Flower")
        .doc(widget.docid)
        .get()
        .then((value) {
      setState(() {
      _namecontroller = TextEditingController(text: value.data()['Flowername']);
      _pricecontroller =TextEditingController(text: value.data()['price'].toString());
      _typecontroller = TextEditingController(text: value.data()['type']);
      });
    });
  }
  Future<void> update() async{
    await FirebaseFirestore.instance
    .collection("Flower")
    .doc(widget.docid)
    .update({
      'Flowername':_namecontroller.text,
      'price':int.parse(_pricecontroller.text),
      'type':_typecontroller.text,
    }).whenComplete(() => Navigator.pop(context));
  }


}