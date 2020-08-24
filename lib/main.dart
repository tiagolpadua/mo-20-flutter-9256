import 'package:bytebank/screens/contact/list.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
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
    return ScopedModel<DarkModeModel>(
      model: DarkModeModel(),
      child: ScopedModelDescendant<DarkModeModel>(
        builder: (context, child, model) {
          return MaterialApp(
            theme: model.darkmode ? ThemeData.dark() : temaDefault(),
            home: Dashboard(),
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
  );
}
