import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class DetalhaContato extends StatelessWidget {
  final Contact _contato;

  DetalhaContato(this._contato);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_contato.nome),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('${_contato.accountNumber}'),
      ),
    );
  }
}
