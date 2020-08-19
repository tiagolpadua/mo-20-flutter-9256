import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        body: ListaTransferencias(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    ),
  );
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemTransferencia(100.0, 500),
        ItemTransferencia(500.0, 200),
        ItemTransferencia(700.0, 99900),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {

  final double valor;
  final int numeroConta;

  ItemTransferencia(this.valor, this.numeroConta);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(valor.toString()),
        subtitle: Text(numeroConta.toString()),
        leading: Icon(Icons.monetization_on),
      ),
    );
  }
}
