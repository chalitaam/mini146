
import 'package:firebasepro/screens/home.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'authen.dart';
class Login extends StatefulWidget {
  
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Movie'),
      ),
     body: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top:30),),
           Image.asset("img/The-Old-Guard.jpg"),  
     GoogleSignInButton(
         borderRadius: 10,
        onPressed: () => signInwithGoogle().then((value) {
          if(value!=null){
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute( builder: (context)=>Homepage()
              ),
               (route) => false);
          }
        })
        ),  
          ],

  
         
),





       
       
       

      //padding:  EdgeInsets.all(25),  
     
    ),
    );
  }
}
