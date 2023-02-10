import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'animation.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'loginpage.dart';

class SocialPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
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
            DelayedAnimation(child:
              Container(
                height: 300,
                child: Image.asset('assets/images/dolibarr1.jpg'),
              ),
                delay: 1000),
            DelayedAnimation(child:
            Container(
              child: Container(
                margin: EdgeInsets.symmetric(
                vertical:14,
                horizontal: 40,
              ),
                child: Column(
                  children: [
                    ElevatedButton(onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0F2A66),
                          shape: StadiumBorder(),
                          padding:EdgeInsets.all(13)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('INSCRIPTION',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16
                            )
                              ,)
                          ],
                        )
                    ),
                    SizedBox(height: 20),

              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF8E8E8E),
                      shape: StadiumBorder(),
                      padding:EdgeInsets.all(13)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('CONNEXION',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16)
                      )
                      ],
                  )
              ),
              SizedBox(height: 20),
                  ],
                ),
              ),
                ),
                delay: 3000)
          ],
        ),
      ),
    );
  }
}
