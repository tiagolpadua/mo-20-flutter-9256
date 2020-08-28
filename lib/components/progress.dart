import 'package:flutter/material.dart';
// Pasta components
// 3 - Implementar e utilizar o progress em list.dart e lista.dar
class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text('Loading'),
        ],
      ),
    );
  }
}
