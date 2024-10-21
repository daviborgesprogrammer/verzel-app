import 'package:flutter/material.dart';

class User {
  int? id;
  String? name;
  String? cpf;
  String? birthdate;
  String? email;
  String? zip;
  String? address;
  String? number;
  String? password;
  User({
    this.id,
    this.name,
    this.cpf,
    this.birthdate,
    this.email,
    this.zip,
    this.address,
    this.number,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'cpf': cpf,
      'birthdate': birthdate,
      'email': email,
      'zip': zip,
      'address': address,
      'number': number,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'] != null ? map['name'] as String : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
      birthdate: map['birthdate'] != null ? map['birthdate'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      zip: map['zip'] != null ? map['zip'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      number: map['number'] != null ? '${map['number']}' : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }
  User copyWith({
    ValueGetter<int?>? id,
    ValueGetter<String?>? name,
    ValueGetter<String?>? cpf,
    ValueGetter<String?>? birthdate,
    ValueGetter<String?>? email,
    ValueGetter<String?>? zip,
    ValueGetter<String?>? address,
    ValueGetter<String?>? number,
    ValueGetter<String?>? password,
  }) {
    return User(
      id: id != null ? id() : this.id,
      name: name != null ? name() : this.name,
      cpf: cpf != null ? cpf() : this.cpf,
      birthdate: birthdate != null ? birthdate() : this.birthdate,
      email: email != null ? email() : this.email,
      zip: zip != null ? zip() : this.zip,
      address: address != null ? address() : this.address,
      number: number != null ? number() : this.number,
      password: password != null ? password() : this.password,
    );
  }
}
