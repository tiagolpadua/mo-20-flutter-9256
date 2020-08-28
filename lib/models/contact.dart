class Contact {
  final int id;
  final String name;
  final int accountNumber;

  Contact(this.id, this.name, this.accountNumber);

  // 2 - Criar a conversão e desconversão de json no contact
  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        accountNumber = json['accountNumber'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'accountNumber': accountNumber,
  };

  @override
  String toString() {
    return 'Contact{id: $id, nome: $name, accountNumber: $accountNumber}';
  }
}
