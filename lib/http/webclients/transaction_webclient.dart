import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

import '../webclient.dart';

class TransactionWebClient {
  Future<Transaction> save(Transaction transaction) async {
    // Transaction -> json
    final String transactionJson = jsonEncode(transaction.toJson());
    final Response response = await client.post(
      baseUrl,
      headers: {
        'Content-type': 'application/json',
        'password': '1000',
      },
      body: transactionJson,
    );
    // json -> Transaction
    return Transaction.fromJson(jsonDecode(response.body));
  }

  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(baseUrl).timeout(
          Duration(
            seconds: 50,
          ),
        );

    final List<dynamic> transactionsJson = jsonDecode(response.body);
    final List<Transaction> transactions = List();

    for (Map<String, dynamic> transactionJson in transactionsJson) {
      // json -> Transaction
      transactions.add(Transaction.fromJson(transactionJson));
    }

    return transactions;
  }
}
