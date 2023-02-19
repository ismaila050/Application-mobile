import 'package:flutter/material.dart';
import 'package:mn_app/Pages/Accueil.dart';
//import 'package:mn_app/Pages/InscriptionPage.dart';
import 'package:mn_app/Pages/background.dart';
import 'package:http/http.dart' as http;

import 'Condition.dart';

class LoginScreen extends StatelessWidget {
  var loginController =TextEditingController();
  var passwordController =TextEditingController();

  LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<void> fetchData() async {
      if (loginController.text.isEmpty || passwordController.text.isEmpty) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text("Veuillez remplir tous les champs"),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        return;
      }
      final url = Uri.parse('http://localhost/dolibarr/api/index.php/login');
      final response = await http.post(url,body: {
        'login': loginController.text,
        'password': passwordController.text,
      } );
      if (response.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Accueil()));
        // Analyser les données et les intégrer dans votre application Flutter Dolibarr
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text("Incorrect username or password"),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      }
    }
    return Scaffold(
      body: Background( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "CONNEXION",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36
                ),
                textAlign: TextAlign.left,
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: loginController,
                decoration: const InputDecoration(
                    labelText: "ID"
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    labelText: "mot de passe"
                ),
                obscureText: true,
              ),
            ),

            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                  onTap: () => {},
                child:const Text(
                "Mot de passe oublié",
                style: TextStyle(
                    fontSize: 12,

                    color: Color(0XFF2661FA)
                ),
              ),
              ),

              ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: (){fetchData();
                 },

                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                      gradient: const LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.blue,
                          ]
                      )
                  ),
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    "se connecter",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),

            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InscriptionPage()))
                },
                child: const Text(
                  "Créer un nouveau compte",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    final firstControlPoint = Offset(size.width * 0.6, 0);
    final firstEndPoint = Offset(size.width * 0.58, 44);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    final secControlPoint = Offset(size.width * 0.55, 50);
    final secEndPoint = Offset(size.width * 0.5, 50);
    path.quadraticBezierTo(
      secControlPoint.dx,
      secControlPoint.dy,
      secEndPoint.dx,
      secEndPoint.dy,
    );

//     path.lineTo(size.width * 0.45, 30);

//     final lastControlPoint = Offset(size.width * 0.45, 20);
//     final lastEndPoint = Offset(size.width * 0.2, 30);
//     path.quadraticBezierTo(
//       lastControlPoint.dx,
//       lastControlPoint.dy,
//       lastEndPoint.dx,
//       lastEndPoint.dy,
//     );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


