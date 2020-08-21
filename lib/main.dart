import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DarkModeModel extends Model {
  bool _darkmode = false;

  bool get darkmode => _darkmode;

  void toggle() {
    _darkmode = !_darkmode;
    debugPrint('Dark mode is now $_darkmode');
    notifyListeners();
  }
}

void main() {
  runApp(
    BytebankApp(),
  );
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1 - Cria o ScopedModel
    return ScopedModel<DarkModeModel>(
      model: DarkModeModel(),

      // 3 - Envolver MaterialApp em um ScopedModelDescendant para
      //     pegar o model
      child: ScopedModelDescendant<DarkModeModel>(
        builder: (context, child, model) {
          return MaterialApp(
            theme: model.darkmode ? ThemeData.dark() : temaDefault(),
            home: ListaTransferencias(),
          );
        },
      ),
    );
  }
}

ThemeData temaDefault() {
  return ThemeData(
    primaryColor: Colors.green[900],
    accentColor: Colors.blueAccent[700],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueAccent[700],
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.blueAccent[700],
    ),
  );
}
