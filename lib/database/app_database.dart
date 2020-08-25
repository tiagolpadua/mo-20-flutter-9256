import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// 1 - Alterar para que createDatabase tenha retorno
Future<Database> createDatabase() {
  // Aqui
  return getDatabasesPath().then(
    (dbPath) {
      final String path = join(dbPath, 'bytebank.db');
      debugPrint('path do db: ' + dbPath);
      // E aqui também
      return openDatabase(
        path,
        onCreate: (db, version) {
          db.execute('CREATE TABLE contacts('
              'id INTEGER PRIMARY KEY, '
              'name TEXT, '
              'account_number INTEGER)');
          debugPrint('DB Criado com sucesso!');
        },
        version: 1,
        // onDowngrade: onDatabaseDowngradeDelete
      );
    },
  );
}
// 2 - Implementar o save
// 3 - Incluir ID no Contact
Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();

    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;

    return db.insert('contacts', contactMap);
  });
}
