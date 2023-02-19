/*
import 'package:flutter/material.dart';
import 'package:mn_app/Pages/login.dart';
import 'package:mn_app/Pages/background.dart';

class InscriptionPage extends StatelessWidget {
  String Nom = '';
  String Prenom = '';
  String Identifiant = '';
  String Motdepasse = '';
  String ConfirmerMDP= '';

  final _formukey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        key:_formukey ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Nom"),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Entrez un nom';
                    }
                    return null;
                  },
                onChanged:(val) => Nom = val ,
              ),
            ),

            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child:  TextFormField(
                decoration: const InputDecoration(labelText: "Prénom"),
                validator: (val) => val!.isEmpty ? 'Entrez un nom' : null ,
                onChanged:(val) => Prenom = val ,
              ),
            ),
            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "identifiant"),
                validator: (val) => val!.isEmpty ? 'Entrez un identifiant' : null ,
                onChanged:(val) => Identifiant = val ,
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "mot de passe"),
                validator: (val) => val!.length< 12 ? 'Entrez un mot de passe avec 12 Caracteres ou plus' : null ,
                onChanged:(val) => Motdepasse = val ,
                obscureText: true,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "confirmer mot de passe"),
                obscureText: true,
                onChanged:(val) => ConfirmerMDP = val ,
                validator: (val) => ConfirmerMDP != Motdepasse ? ' les Mots de passe ne correspondent pas' : null ,

              ),
            ),

            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  if( _formukey.currentState!.validate()){}
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 1 ,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    "s'inscrire",
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
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                },
                child: const Text(
                  "Si vous allez un compte? connecter-vous",
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
*/