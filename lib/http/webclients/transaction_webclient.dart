import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

import '../webclient.dart';

// 1 - Criar a pasta webclients
// 2 - Criar o transaction_webclient.dart
// 3 - Mover findAll e save do webclient.dart para a nova classe

class TransactionWebClient {
  Future<Transaction> save(Transaction transaction) async {
    Map<String, dynamic> transactionMap = {
      'value': transaction.value,
      'contact': {
        'name': transaction.contact.name,
        'accountNumber': transaction.contact.accountNumber,
      }
    };
    final String transactionJson = jsonEncode(transactionMap);

    final Response response = await client.post(
      baseUrl,
      headers: {
        'Content-type': 'application/json',
        'password': '1000',
      },
      body: transactionJson,
    );

    Map<String, dynamic> transactionCreateJson = jsonDecode(response.body);

    final Map<String, dynamic> contactJson = transactionCreateJson['contact'];

    print("transactionCreateJson['id']: $transactionCreateJson['id']");

    return Transaction(
      transactionCreateJson['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );
  }

  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(baseUrl).timeout(
          Duration(
            seconds: 50,
          ),
        );

    final List<dynamic> transactionJson = jsonDecode(response.body);
    final List<Transaction> transactions = List();

    for (Map<String, dynamic> element in transactionJson) {
      Transaction transaction = Transaction(
        element['value'],
        Contact(
          0,
          element['contact']['name'],
          element['contact']['accountNumber'],
        ),
      );
      transactions.add(transaction);
    }

    return transactions;
  }
}
