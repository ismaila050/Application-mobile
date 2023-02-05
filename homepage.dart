import 'package:appmobile1/pages/featurespage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';




class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("MyApp"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bienvenue sur mon application",
              style: TextStyle(
                  fontSize: 42,
                  fontFamily: 'Poppins'
              ),
            ),
            Text(
              "Texte en dessous",
              style: TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push
                  (context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___ ) => FeaturesPage()
                 )
                );
              },
              child: Text("Afficher les fonctionnalités",
                style: TextStyle(
                    fontSize: 20
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
