import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

//Classe qui définit l'application Flutter

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), //Page de connexion est définie comme page d'accueil
    );
  }
}
//Classe qui définit la page d'accueil
class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
      ),

//Ajout d'un drawer pour les options

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Options"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            // Option pour aller à la page dictionnaire

            ListTile(
              title: Text("Dictionnaire"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DictionnairePage(),
                  ),
                );
              },
            ),

            //Option pour déconnecter l'utilisateur

            ListTile(
              title: Text("Déconnexion"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirmer la déconnexion"),
                      content: Text("Voulez-vous vraiment vous déconnecter?"),
                      actions: <Widget>[
                        ElevatedButton(
                          child: Text("Oui"),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                          },
                        ),
                        ElevatedButton(
                          child: Text("Non"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),

      //Corps de la page d'accueil
      body: Center(
        child: Text("BIENVENU"),
      ),
    );
  }
}

//Classe qui définit la page de dictionnaire

class DictionnairePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dictionnaire"),
      ),

      //Corps de la page dictionnaire

      body: Center(
        child: Text("Voila la page de dictionnaire"),
      ),
    );
  }
}

    //Classe qui définit la page d'authentification avec un état interne

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

//Classe qui définit la page Document

class DocumentPag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Documents"),
      ),
      body: Center(
        child: Text("Voila la page de Document"),
      ),
    );
  }
}

//Classe qui définit l'etat interne de la page d'authentification

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  //Soumettre les informations d'indentification
  void _submit() {
    // Valider les champs de formulaire
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();// sauvegarder les données
      _login(_username, _password);; // appeler la méthode pour se connecter
    }
  }

  // Connecter l'utilisateur avec les informations d'identification

  void _login(String username, String password) async {
    // URL pour la requête API de connexion
    var url = Uri.parse('http://www.is.sn/api/index.php/login');
// Corps de la requête API avec les informations d'identification
    var body = jsonEncode({
      'login': username,
      'username': username,
      'password': password,
    });
    // Effectuer la requête API pour se connecter
    var response = await http.post(
        url, headers: {'Content-Type': 'application/json'}, body: body);
// Décoder la réponse de la requête API
    var decoded = jsonDecode(response.body);
    // Vérifier si la connexion a réussi
    if (response.statusCode == 200) {
      // Naviguer vers la page d'accueil si la connexion a réussi
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Accueil(),
        ),
      );
    } else {
      // Afficher une boîte de dialogue d'erreur si la connexion a échoué
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text("Incorrect username or password"),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });

    }
    print(decoded); //Afficher les données décodées dans la console
  }


// Override la méthode build pour dessiner l'interface utilisateur
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ajouter une barre d'applet avec un titre "AUTHENTIFICATION"
      appBar: AppBar(
        title: Text("AUTHENTIFICATION"),
      ),
      // Ajouter un corps de formulaire à la page
      body: Form(
        // Assigner une clé au formulaire pour la validation
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Champ de saisie de nom d'utilisateur avec la décoration "Username"
            TextFormField(
              decoration: InputDecoration(labelText: 'Username'),
              // Valider si le champ de saisie de nom d'utilisateur est vide
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Please enter your username';
                }
                return null;
              },
              // Enregistrer la valeur entrée dans _username
              onSaved: (value) => _username = value ?? "",
            ),
            // Champ de saisie de mot de passe avec la décoration "Password"
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              // Valider si le champ de saisie de mot de passe est vide
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Please enter your password';
                }
                return null;
              },
              // Enregistrer la valeur entrée dans _password
              onSaved: (value) => _password = value ?? "",
              obscureText: true,
            ),
            // Bouton de soumission pour envoyer le formulaire
            ElevatedButton(
              onPressed: _submit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
