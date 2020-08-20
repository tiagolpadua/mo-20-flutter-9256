import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario_transferencia.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  _ListaTransferenciasState createState() => _ListaTransferenciasState();
}

class _ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    debugPrint('build ListaTransferencias!');

    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          return ItemTransferencia(widget._transferencias[indice]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FomularioTransferencia();
              },
            ),
          );
          future.then(
            (Transferencia transferenciaCriada) {
              debugPrint('Voltou pra tela inicial: $transferenciaCriada');
              // 1 - Quando volta sem criar transf dá crash, verificar se não é
              //     nulo
              if (transferenciaCriada != null) {
                setState(() {
                  widget._transferencias.add(transferenciaCriada);
                });
              }
            },
          );
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
        leading: Icon(Icons.monetization_on),
      ),
    );
  }
}
