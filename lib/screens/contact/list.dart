import 'package:bytebank/screens/contact/form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(
                'Alex',
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                '1000',
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 5 - Receber dados da navegação
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ConctactForm(),
            ),
          ).then((newContact) {
            debugPrint('Tela de lista contatos recebeu $newContact');
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}