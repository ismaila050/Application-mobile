import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String _username = "";
  String _firstName = "";
  String _lastName = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final response = await http.post(
        Uri.parse('https://example.com/api/users'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': _username,
          'firstName': _firstName,
          'lastName': _lastName,
          'email': _email,
          'password': _password,
        }),
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          msg: "Inscription réussie",
          backgroundColor: Colors.green,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Erreur lors de l'inscription",
          backgroundColor: Colors.red,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0F2A66),
          title: Text('Inscription'),
        ),
        body: SingleChildScrollView(
        child: Container(
        padding: EdgeInsets.all(16),
    child: Form(
    key: _formKey,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    TextFormField(
    decoration: InputDecoration(
    labelText: 'Nom d\'utilisateur',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Veuillez entrer un nom d\'utilisateur';
    }
    return null;
    },
    onSaved: (value) {
    _username = value!;
    },
    ),
    SizedBox(height: 8),
    TextFormField(
    decoration: InputDecoration(
    labelText: 'Prénom',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Veuillez entrer votre prénom';
    }
    return null;
    },
    onSaved: (value) {
    _firstName = value!;
    },
    ),
    SizedBox(height: 8),
    TextFormField(
    decoration: InputDecoration(
    labelText: 'Nom de famille',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Veuillez entrer votre nom de famille';
    }
    return null;
    },
    onSaved: (value) {
    _lastName = value!;
    },
    ),
    SizedBox(height: 8),
    TextFormField(
    decoration: InputDecoration(
    labelText: 'Email',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Veuillez entrer votre adresse email';
    }
    return null;
    },
    onSaved: (value) {
    _email = value!;
    },
    ),
          SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Mot de passe',
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer un mot de passe';
              }
              return null;
            },
            onSaved: (value) {
              _password = value!;
            },
          ),

          SizedBox(height: 8),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Confirmer mot de passe',
        ),
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez confirmer votre mot de passe';
          }
          // vérifier que le mot de passe confirmé correspond au mot de passe précédent
          if (value != _password) {
            return 'Les mots de passe ne correspondent pas';
          }
          return null;
        },
      ),
      SizedBox(height: 16),
      ElevatedButton(
        onPressed:  () {
          
        },
        child: Text('S\'inscrire'),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF0F2A66),
          onPrimary: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),

      ],
    ),
        ),
        ),
    ),
    );
  }
}