import 'package:flutter/material.dart';
class DocumentPage extends StatefulWidget {
  const DocumentPage({super.key});

  @override
  DocumentPageState createState() => DocumentPageState();
}

class DocumentPageState extends State<DocumentPage> {
  final _formKey = GlobalKey<FormState>();

  String _modulePart = '';
  String _originalFile = '';
  String _docTemplate = '';
  String _langCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un document de modèle'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Module part'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir une valeur';
                  }
                  return null;
                },
                onSaved: (value) => _modulePart = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Original file'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir une valeur';
                  }
                  return null;
                },
                onSaved: (value) => _originalFile = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Document template'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir une valeur';
                  }
                  return null;
                },
                onSaved: (value) => _docTemplate = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Language code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir une valeur';
                  }
                  return null;
                },
                onSaved: (value) => _langCode = value ?? '',
              ),
              ElevatedButton(
                child: const Text('Valider'),
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