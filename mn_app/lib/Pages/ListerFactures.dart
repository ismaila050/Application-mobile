
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  ListerFacturesState createState() => ListerFacturesState();
}

class ListerFacturesState extends State<ListerFactures> {
  final TextEditingController _sortFieldController = TextEditingController();
  final TextEditingController _sortOrderController = TextEditingController();
  final TextEditingController _limitController = TextEditingController();
  final TextEditingController _pageController = TextEditingController();
  final TextEditingController _thirdPartyIdsController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  bool isLoading = false; // Ajout de la variable _isLoading
  List<dynamic> _invoices = [];
  bool loading = false;

  void _fetchInvoices() async {
    setState(() {
      loading = true;
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
        loading = false;
      });
    } else {
      setState(() {
        _invoices = [];
        loading = false;
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
      body: loading
          ? const Center(
           child: CircularProgressIndicator(),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
            if (loading)
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