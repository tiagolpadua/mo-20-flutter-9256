import 'package:http/http.dart';

// 1 - Incluir dependencia http no pubspec.yaml
// 2 - Criar arquivo webclient.dart na pasta http
// 3 - Implementar findAll
// 4 - Chamar findAll no main
// 5 - Porquê não funciona?
void findAll() {
  print('Chamou findAll!');
  get('http://192.168.0.100:8080/transactions')
      .then((resp) {
    print('resp.body: ${resp.body}');
  });
}