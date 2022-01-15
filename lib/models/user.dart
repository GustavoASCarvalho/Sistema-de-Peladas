import 'dart:convert';

class User {
  final String id;
  final String email;
  final String password;
  final String name;
  final String phone;
  final String? cpf;
  final String? cnpj;
  final String token;
  final DateTime expiraEm;
  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    this.cpf,
    this.cnpj,
    required this.token,
    required this.expiraEm,
  });

  User copyWith({
    String? id,
    String? email,
    String? password,
    String? name,
    String? phone,
    String? cpf,
    String? cnpj,
    String? token,
    DateTime? expiraEm,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      cpf: cpf ?? this.cpf,
      cnpj: cnpj ?? this.cnpj,
      token: token ?? this.token,
      expiraEm: expiraEm ?? this.expiraEm,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'cpf': cpf,
      'cnpj': cnpj,
      'token': token,
      'expiraEm': expiraEm.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      cpf: map['cpf'],
      cnpj: map['cnpj'],
      token: map['token'] ?? '',
      expiraEm: DateTime.fromMillisecondsSinceEpoch(map['expiraEm']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, email: $email, password: $password, name: $name, phone: $phone, cpf: $cpf, cnpj: $cnpj, token: $token, expiraEm: $expiraEm)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.email == email &&
        other.password == password &&
        other.name == name &&
        other.phone == phone &&
        other.cpf == cpf &&
        other.cnpj == cnpj &&
        other.token == token &&
        other.expiraEm == expiraEm;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        password.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        cpf.hashCode ^
        cnpj.hashCode ^
        token.hashCode ^
        expiraEm.hashCode;
  }
}
