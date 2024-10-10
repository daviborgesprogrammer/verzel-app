import 'address_model.dart';

class User {
  String? name;
  String? cpf;
  String? birthdate;
  String? email;
  Address? address;
  String? password;
  User({
    this.name,
    this.cpf,
    this.birthdate,
    this.email,
    this.address,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'cpf': cpf,
      'birthdate': birthdate,
      'email': email,
      'address': address?.toMap(),
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] != null ? map['name'] as String : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
      birthdate: map['birthdate'] != null ? map['birthdate'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      address: map['address'] != null
          ? Address.fromMap(map['address'] as Map<String, dynamic>)
          : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }
}
