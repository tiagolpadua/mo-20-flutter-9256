import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

// 1 -Converter ConctactForm para  StatefulWidget (ALT+ENTER)
class ConctactForm extends StatefulWidget {
  @override
  _ConctactFormState createState() => _ConctactFormState();
}

class _ConctactFormState extends State<ConctactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              // Vinculou os controllers
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            TextField(
              controller: _accountNumberController,
              decoration: InputDecoration(
                labelText: 'Account Number',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Create'),
                  onPressed: () {
                    final String name = _nameController.text;
                    final int accountNumber =
                        int.tryParse(_accountNumberController.text);
                    if (name != null &&
                        name.length > 0 &&
                        accountNumber != null) {
                      final Contact newContact =
                          Contact(0, name, accountNumber);

                      // 4 - Realizar persistência no form
                      save(newContact).then(
                        (id) {
                          debugPrint('id do elemento salvo: $id');
                          Navigator.pop(context, newContact);
                        },
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void dispose() {
    debugPrint("Chamou o dispose do _ConctactFormState");
    _nameController.dispose();
    _accountNumberController.dispose();
    super.dispose();
  }
}
