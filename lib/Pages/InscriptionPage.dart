import 'package:flutter/material.dart';
import 'package:mn_app/Pages/login.dart';
import 'package:mn_app/Pages/background.dart';

class InscriptionPage extends StatefulWidget {
  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  String nom = '';
  String prenom = '';
  String identifiant = '';
  String motdepasse = '';
  String confirmerMDP = '';

  final _formukey = GlobalKey<FormState>();
  bool nomError = false;
  bool prenomError = false;
  bool identifiantError = false;
  bool motdepasseError = false;
  bool confirmerMDPError = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Background(
            key: _formukey,
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
                onChanged: (val) {
                  setState(() {
                    nom = val;
                    nomError = false;
                  });
                },
              ),
            ),
            if (nomError) Text('Le champ nom ne peut pas être vide'),
               SizedBox(height: size.height * 0.03),
                  Container(
                   alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                   child: TextFormField(
                     decoration: const InputDecoration(labelText: "Prénom"),
                      validator: (val) {
                       if (val!.isEmpty) {
                        return 'Entrez un prénom';
                        }
                        return null;
                        },
                        onChanged: (val) {
                        setState(() {
                        prenom = val;
                        prenomError = false;
                        });
                        },
                        ),
                        ),
             if (prenomError) Text('Le champ prénom ne peut pas être vide'),
             SizedBox(height: size.height * 0.03),
               Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                decoration:
                const InputDecoration(labelText: "identifiant"),
                validator: (val) {
                if (val!.isEmpty) {
                return 'Entrez un identifiant';
                }
                return null;
                },
                onChanged: (val) {
                setState(() {
                identifiant = val;
                identifiantError = false;
                });
                },
                ),
                ),
                if (identifiantError)
             Text('Le champ identifiant ne peut pas être vide'),
              SizedBox(height: size.height * 0.03),
               Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                  decoration:
                  const InputDecoration(labelText: "mot de passe"),
                  validator: (val) {
                  if (val!.isEmpty) {
                  return 'Entrez un mot de passe';
                  } else if (val.length < 12) {
                    return 'Entrez un mot de passe avec 12 Caractères ou plus';
                  }
                  return null;
                  },
                    onChanged: (val) => motdepasse = val,
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
                      onChanged: (val) => confirmerMDP = val,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Confirmez votre mot de passe';
                        } else if (val != motdepasse) {
                          return 'Les mots de passe ne correspondent pas';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    alignment: Alignment.centerRight,
                    margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formukey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Inscription réussie')));
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: size.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: const EdgeInsets.all(0),
                        child: const Text(
                          "s'inscrire",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginScreen()))
                      },
                      child: const Text(
                        "Si vous avez un compte? Connectez-vous",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2661FA)),
                      ),
                    ),
                  )
                ],
            ),
        ),
    );
  }
}
