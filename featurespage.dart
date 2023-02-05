import 'package:flutter/material.dart';

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des fonctionnalités"),
      ),
      body: Center(
        child: Text("Bientôt disponible"),
      ),
    );
  }
}
