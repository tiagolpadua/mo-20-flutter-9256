import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../main.dart';
import 'formulario.dart';

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
        actions: <Widget>[
          // 2 - Consumir o ScopedModel
          ScopedModelDescendant<DarkModeModel>(
              builder: (context, child, model) {
            return IconButton(
              icon: Icon(Icons.lightbulb_outline),
              onPressed: () => model.toggle(),
            );
          }),
        ],
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          return ItemTransferencia(widget._transferencias[indice]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),

        // 0 - Criar pacote screens.transferencia e mover
        //     arquivo formulario e lista

        // ALT+ENTER
        // 1 - Refatorar métodos para expression body
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FomularioTransferencia(),
          ),
        ).then(
          (transferenciaCriada) {
            if (transferenciaCriada != null) {
              setState(() => widget._transferencias.add(transferenciaCriada));
            }
          },
        ),
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
