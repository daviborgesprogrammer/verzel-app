import 'address_model.dart';

class User {
  String? firstName;
  String? lastName;
  String? cpf;
  String? birthdate;
  String? email;
  Address? address;
  String? password;
  User({
    this.firstName,
    this.lastName,
    this.cpf,
    this.birthdate,
    this.email,
    this.address,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'cpf': cpf,
      'birthdate': birthdate,
      'email': email,
      'address': address?.toMap(),
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
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
