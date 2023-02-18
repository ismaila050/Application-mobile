import 'package:flutter/material.dart';

import 'loginpage.dart';

class DashboardPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F2A66),
        title: Text('Dolibarr'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),

      body: ListView(
        controller: _scrollController,
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
