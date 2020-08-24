
class Contact {
  final String nome;
  final int accountNumber;

  // ALT+ENTER para criar o construtor
  Contact(this.nome, this.accountNumber);

  // ALT+INSERT para criar o "toString"
  @override
  String toString() {
    return 'Contact{nome: $nome, accountNumber: $accountNumber}';
  }
}