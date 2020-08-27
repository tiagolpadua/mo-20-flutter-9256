import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

import 'logging_interceptor.dart';

// 1 - Ajustar tipo de retorno
Future<List<Transaction>> findAll() async {
  Client client = HttpClientWithInterceptor.build(interceptors: [
    LoggingInterceptor(),
  ]);

  final Response response =
      await client.get('http://192.168.0.100:8080/transactions');

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
