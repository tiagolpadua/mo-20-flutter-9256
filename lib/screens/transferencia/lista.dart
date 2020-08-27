import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../main.dart';

class ListaTransferencias extends StatefulWidget {
  @override
  _ListaTransferenciasState createState() => _ListaTransferenciasState();
}

class _ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        actions: <Widget>[
          ScopedModelDescendant<DarkModeModel>(
              builder: (context, child, model) {
            return IconButton(
              icon: Icon(Icons.lightbulb_outline),
              onPressed: () => model.toggle(),
            );
          }),
        ],
      ),
      // 2 - Utilizar o FutureBuilder
      body: FutureBuilder<List<Transaction>>(
        future: findAll(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, indice) {
              return ItemTransferencia(snapshot.data[indice]);
            },
          );
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transaction _transaction;

  ItemTransferencia(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_transaction.value.toString()),
        subtitle: Text(_transaction.contact.accountNumber.toString()),
        leading: Icon(Icons.monetization_on),
      ),
    );
  }
}
