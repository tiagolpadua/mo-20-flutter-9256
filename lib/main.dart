import 'package:flutter/material.dart';

void main() {
  runApp(
    BytebankApp(),
  );
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FomularioTransferencia(),
    );
  }
}

class FomularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          BotaoConfirmar(_controladorCampoNumeroConta, _controladorCampoValor),
        ],
      ),
    );
  }
}

class BotaoConfirmar extends StatelessWidget {
  const BotaoConfirmar(
    this._controladorCampoNumeroConta,
    this._controladorCampoValor,
  );

  final TextEditingController _controladorCampoNumeroConta;
  final TextEditingController _controladorCampoValor;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Confirmar'),
      onPressed: () {
        debugPrint("cliclou em confirmar!");
        final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
        final double valor = double.tryParse(_controladorCampoValor.text);

        if (numeroConta != null && valor != null) {
          final transferencia = Transferencia(valor, numeroConta);
          debugPrint('$transferencia');
        } else {
          final snackBar = SnackBar(
            content: Text('Valores Inválidos!'),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        }
      },
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(777000.0, 5000)),
          ItemTransferencia(Transferencia(500.0, 200)),
          ItemTransferencia(Transferencia(700.0, 99900)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
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

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  // ALT + Inset -> toString
  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
