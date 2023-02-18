import 'dart:convert';
import 'package:appmobile/Menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'animation.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black45,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
         child: Column(
          children: [
            Container(
         margin: EdgeInsets.symmetric(
         vertical:40,
           horizontal: 30,
         ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedAnimation(child:
                  Container(
                    height: 100,
                    child: Text('Connect your account',
                        style: GoogleFonts.poppins(
                            color: Color(0xFF0F2A66),
                            fontSize: 30)),
                  ),
                      delay: 1000),
                  SizedBox(height: 35),
                  LoginForm(),
                  SizedBox(height: 125),
                  DelayedAnimation(
                      delay: 2000,
                      child:
                      ElevatedButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage() ),
                        );
                      },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF0F2A66),
                              shape: StadiumBorder(),
                              padding:EdgeInsets.symmetric(
                                vertical: 13,
                                horizontal: 125
                              )
                          ),
                          child:
                              Text('CONFIRM',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16
                                )
                                ,)
                            ,
                          )
                      ),
                ],
              ),
         )
      ]
    ),
      )
    );
  }
}


class LoginForm extends StatefulWidget {

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          DelayedAnimation(
            delay: 3500,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 4500,
            child: TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
