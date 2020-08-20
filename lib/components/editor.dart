import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controladorCampo;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controladorCampo, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: TextField(
        controller: controladorCampo,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}