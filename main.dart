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
class DocumentPage extends StatefulWidget {
  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  final _formKey = GlobalKey<FormState>();

  String _modulePart = '';
  String _originalFile = '';
  String _docTemplate = '';
  String _langCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer un document de modèle'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Module part'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir une valeur';
                  }
                  return null;
                },
                onSaved: (value) => _modulePart = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Original file'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir une valeur';
                  }
                  return null;
                },
                onSaved: (value) => _originalFile = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Document template'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir une valeur';
                  }
                  return null;
                },
                onSaved: (value) => _docTemplate = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Language code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir une valeur';
                  }
                  return null;
                },
                onSaved: (value) => _langCode = value ?? '',
              ),
              ElevatedButton(
                child: Text('Valider'),
                onPressed: () {
                  if (_formKey.currentState != null) {
                    if (_formKey.currentState?.validate() == true) {
                      _formKey.currentState?.save();
                      // Envoyer une requête pour créer un document
                      // avec les données saisies par l'utilisateur
                      // _modulePart, _originalFile, _docTemplate, _langCode
                    }
                  }

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//Classe qui définit la page d'accueil
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
              title: const Text("SORTIR"),
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
                              builder: (context) => LoginPage(),
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
      body: const Center(
        child: Text("BIENVENU"),
      ),
    );
  }
}





//Classe qui définit la page d'authentification avec un état interne

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

//Classe qui définit la page pour avoir la liste des documents(pas encore)


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
      _login(_username, _password); // appeler la méthode pour se connecter
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
    //var decoded = jsonDecode(response.body);
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
    //print(decoded); //Afficher les données décodées dans la console
  }


// Override la méthode build pour dessiner l'interface utilisateur
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ajouter une barre d'applet avec un titre "AUTHENTIFICATION"
      appBar: AppBar(
        title: const Text("AUTHENTIFICATION"),
      ),
      // Ajouter un corps de formulaire à la page
      body: Form(
        // Assigner une clé au formulaire pour la validation
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Champ de saisie de nom d'utilisateur avec la décoration "Username"
            TextFormField(
              decoration: const InputDecoration(labelText: 'Username'),
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
              decoration: const InputDecoration(labelText: 'Password'),
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
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
class FactureDetails extends StatelessWidget {
  final int invoiceId;

  const FactureDetails({Key? key, required this.invoiceId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de la facture'),
      ),
      body: Center(
        child: Text('Facture n°$invoiceId'),
      ),
    );
  }
}

class ListerFactures extends StatefulWidget {
  const ListerFactures({Key? key}) : super(key: key);

  @override
  _ListerFacturesState createState() => _ListerFacturesState();
}

class _ListerFacturesState extends State<ListerFactures> {
  final TextEditingController _sortFieldController = TextEditingController();
  final TextEditingController _sortOrderController = TextEditingController();
  final TextEditingController _limitController = TextEditingController();
  final TextEditingController _pageController = TextEditingController();
  final TextEditingController _thirdPartyIdsController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  bool _isLoading = false; // Ajout de la variable _isLoading
  List<dynamic> _invoices = [];
  bool _loading = false;

  void _fetchInvoices() async {
    setState(() {
      _loading = true;
    });

    final Uri url = Uri.parse('http://www.is.sn/api/index.php/invoices');
    final Map<String, String> params = {
      'sortfield': _sortFieldController.text,
      'sortorder': _sortOrderController.text,
      'limit': _limitController.text,
      'page': _pageController.text,
      'thirdparty_ids': _thirdPartyIdsController.text,
      'status': _statusController.text,
    };

    final request = http.Request('GET', url);
    request.headers.addAll(<String, String>{'DOLAPIKEY': 'dolibarr'});
    request.bodyFields = params;
    final response = await http.get(
      url,
      headers: <String, String>{
        'DOLAPIKEY': 'dolibarr',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        _invoices = jsonDecode(response.body)['results'];
        _loading = false;
      });
    } else {
      setState(() {
        _invoices = [];
        _loading = false;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erreur'),
          content: const Text('Erreur lors de la récupération des factures.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    print(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Liste des factures'),
        ),
        body: _loading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Text(
    'Veuillez entrer les paramètres de la recherche :',
    style: TextStyle(fontSize: 16),
    ),
    const SizedBox(height: 16),
    TextField(
    controller: _sortFieldController,
    decoration: const InputDecoration(
    labelText: 'Champ de tri',
    ),
    ),
    TextField(
    controller: _sortOrderController,
    decoration: const InputDecoration(
    labelText: 'Ordre de tri',
    ),
    ),
    TextField(
    controller: _limitController,
    decoration: const InputDecoration(
    labelText: 'Limite',
    ),
    ),
    TextField(
    controller: _pageController,
    decoration: const InputDecoration(
    labelText: 'page',
    ),
    ),
      TextField(
        controller: _thirdPartyIdsController,
        decoration: const InputDecoration(
          labelText: 'Identifiants de tiers',
        ),
      ),
      TextField(
        controller: _statusController,
        decoration: const InputDecoration(
          labelText: 'Statut de la facture',
        ),
      ),
      const SizedBox(height: 16),
      ElevatedButton(
        onPressed: _fetchInvoices,
        child: const Text('Rechercher'),
      ),
      const SizedBox(height: 16),
      if (_loading)
        const Center(child: CircularProgressIndicator())
      else if (_invoices.isEmpty)
        const Center(child: Text('Aucune facture trouvée.'))
      else
        Expanded(
          child: ListView.builder(
            itemCount: _invoices.length,
            itemBuilder: (context, index) {
              final invoice = _invoices[index] as Map<String, dynamic>;
              return ListTile(
                title: Text(invoice['ref']),
                subtitle: Text(invoice['date']),
                trailing: Text('${invoice['totalAmount']} €'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FactureDetails(invoiceId: invoice['id']),
                    ),
                  );
                },
              );
            },
          ),
        )
    ],
    ),
        ),
    );
  }
}
