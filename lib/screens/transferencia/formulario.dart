import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class FomularioTransferencia extends StatefulWidget {
  @override
  _FomularioTransferenciaState createState() => _FomularioTransferenciaState();
}

class _FomularioTransferenciaState extends State<FomularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // CTRL+ALT+V
    // 2 - Refatorar removendo "Strings livres"
    const _tituloAppBar = 'Criando Transferência';
    const _rotuloCampoValor = 'Valor';
    const _dicaCampoValor = '0.00';
    const _rotuloCampoNumeroConta = 'Número da Conta';
    const _dicaCampoNumeroConta = '0000';
    const _textoBotaoConfirmar = 'Confirmar';

    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controladorCampo: _controladorCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
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
    _controladorCampoNumeroConta.dispose();
    _controladorCampoValor.dispose();
    super.dispose();
  }

  void _criarTransferencia(BuildContext context) {
    debugPrint("cliclou em confirmar!");
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    } else {
      final snackBar = SnackBar(
        content: Text('Valores Inválidos!'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }
}
