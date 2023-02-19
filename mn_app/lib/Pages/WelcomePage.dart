import 'package:flutter/material.dart';
import 'package:mn_app/Pages/AnimationPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mn_app/Pages/Login.dart';
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                  delay: 1500,
                  child:
                  Container(
                    height: 170,
                    child: Image(
                      image: AssetImage('assets/images/dolibarr2.png'),
                    ),
                  )
              ),
              DelayedAnimation(
                  delay: 2500,
                  child:
                  Container(
                    margin: EdgeInsets.only(
                      top:70,
                      bottom: 20,
                    ),
                    child: Text("Bienvenue dans l'application Dolibarr",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Colors.blue[700],
                            fontSize: 30
                        )
                    ),

                  )
              ),

              DelayedAnimation(
                  delay: 2500,
                  child:
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[800],
                            shape: StadiumBorder(),
                            padding: EdgeInsets.all(13)
                        ),
                        child: Text('GET STARTED',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()
                          )
                          );
                        } ,
                      )
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}