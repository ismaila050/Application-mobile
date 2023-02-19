import 'package:flutter/material.dart';
import 'package:mn_app/Pages/Login.dart';
import 'DictionnairePage.dart';
import 'DocumentPage.dart';
import 'ListerFactures.dart';
/*class Accueil extends StatelessWidget {
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
                              builder: (context) => LoginScreen(),
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
}*/
class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accueil"),
      ),

//Ajout d'un drawer pour les options

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text("OPTIONS"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            // Option pour aller à la page dictionnaire
            ExpansionTile(
              title: const Text('DOCUMENTS'),
              children: <Widget>[
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: <Widget>[
                    ListTile(
                      title: const Text('Lister des documents spécifiques'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DocumentPage()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Création de documents de modèle'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DocumentPage()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Télécharger un document'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DocumentPage()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('FACTURE'),
              children: <Widget>[
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: <Widget>[
                    ListTile(
                      title: const Text('Lister les factures'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListerFactures()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Création objet de facture'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DocumentPage()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Supprimer une facture'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DocumentPage()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('UTILISATEURS'),
              children: <Widget>[
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: <Widget>[
                    ListTile(
                      title: const Text('Lister les utilisateurs'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DocumentPage()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Créer un compte utilisateur'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DocumentPage()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Avoir les propriétés '),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DocumentPage()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            //Option pour déconnecter l'utilisateur

            ListTile(
              title: const Text("DECONNECTER"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirmer la déconnexion"),
                      content: const Text("Voulez-vous vraiment vous déconnecter?"),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text("Oui"),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                          },
                        ),
                        ElevatedButton(
                          child: const Text("Non"),
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
      body: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(width: 38),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.description),
              iconSize: 64,
              onPressed: () {
                // Code pour ouvrir la page Documents
              },
            ),
            Text('Documents'),
          ],
        ),
        SizedBox(width: 48),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.monetization_on),
              iconSize: 64,
              onPressed: () {
                // Code pour ouvrir la page Salaires
              },
            ),
            Text('Factures'),
          ],
        ),
        SizedBox(width: 48),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.people),
              iconSize: 64,
              onPressed: () {
                // Code pour ouvrir la page Users
              },
            ),
            Text('Users'),
          ],
        ),


      ],
    ),
    );
  }
}

