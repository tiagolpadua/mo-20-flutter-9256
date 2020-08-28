import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../main.dart';

class ListaTransferencias extends StatefulWidget {
  final TransactionWebClient _webClient = TransactionWebClient();

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
      body: FutureBuilder<List<Transaction>>(
        future: Future.delayed(Duration(seconds: 1))
            .then((value) => widget._webClient.findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return CenteredMessage(
                  'Erro no servidor',
                  icon: Icons.error,
                );
              }

              if (snapshot.data.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, indice) {
                    return ItemTransferencia(snapshot.data[indice]);
                  },
                );
              } else {
                return CenteredMessage(
                  'No transactions found',
                  icon: Icons.warning,
                );
              }
              break;
          }
          return Text('Unkown error');
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
