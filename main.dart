import 'dart:async';
import 'package:mn_app/Pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:mn_app/Pages/LoginPage.dart';

void main() {
  runApp(loginApp());
}

class loginApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey.shade100
      ),
      home: MyScreenPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyScreenPage extends StatefulWidget {
   MyScreenPage({super.key, required this.title});



  final String title;

  @override
  State<MyScreenPage> createState() => _MyScreenPageState();
}

class _MyScreenPageState extends State<MyScreenPage> {
  bool _isVisible = false;
_MyScreenPageState() {
  new Timer(const Duration(milliseconds: 2000), () {
    setState(() {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPage()), (
          route) => false);
    });
  });
  new Timer(
    Duration(milliseconds: 10),(){
      setState(() {
        _isVisible = true;
      });
  }
  );

}
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
       gradient: new LinearGradient(
            colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor],
        begin: const FractionalOffset(0, 0),
        end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        )
      ),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 1200),
        opacity: _isVisible ? 1.0: 0,
        child: Center(
          child:Container(
            height: 140,
            width: 140,
            child: Center(
              child: ClipOval(
                child: Icon(Icons.flip_camera_android_outlined, size: 128,),
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
                  color: Colors.white,
              boxShadow: [
               /* BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 2.0,
                  offset: Offset(5, 3),
                  spreadRadius: 2,
                )*/
              ]
            ),
          )
        ),
      ),
    );
  }
}
