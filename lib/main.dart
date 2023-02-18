import 'package:flutter/material.dart';
import 'animation.dart';
import 'welcomepage.dart';

const d_red = const Color(1);


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

          title: ('Dolibarr'),
          debugShowCheckedModeBanner: false,
          home: WelcomePage(),
        );

  }
}



