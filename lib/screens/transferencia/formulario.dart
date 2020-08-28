import 'package:bytebank/components/editor.dart';
import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';

// CTRL + ALT + o
// 4 - Corrigir  FomularioTransferencia e ListaTransferencia para utilizar
//     o TransactionWebClient
class FomularioTransferencia extends StatefulWidget {
  final Contact contact;
  final TransactionWebClient _webClient = TransactionWebClient();

  FomularioTransferencia(this.contact);

  @override
  _FomularioTransferenciaState createState() => _FomularioTransferenciaState();
}

class _FomularioTransferenciaState extends State<FomularioTransferencia> {
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const _tituloAppBar = 'Criando Transferência';
    const _rotuloCampoValor = 'Valor';
    const _dicaCampoValor = '0.00';
    const _textoBotaoConfirmar = 'Confirmar';

    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              widget.contact.name,
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                widget.contact.accountNumber.toString(),
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Editor(
              controladorCampo: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            Builder(builder: (context) {
              return RaisedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () => _criarTransferencia(context),
              );
            }),
          ],
        ),
      ),
    );
  }

  void dispose() {
    debugPrint("Chamou o dispose do FomularioTransferencia");
    _controladorCampoValor.dispose();
    super.dispose();
  }

  void _criarTransferencia(BuildContext context) {
    debugPrint("cliclou em confirmar!");
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (valor != null) {
      final transferenciaCriada = Transaction(valor, widget.contact);

      widget._webClient.save(transferenciaCriada).then(
        (transaction) {
          if (transaction != null) {
            Navigator.pop(context);
          }
        },
      );
    } else {
      final snackBar = SnackBar(
        content: Text('Valores Inválidos!'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }
}
