class User {
  String? name;
  String? cpf;
  String? birthdate;
  String? email;
  String? zip;
  String? address;
  String? number;
  String? password;
  User({
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

  @override
  String toString() {
    return 'User{name=$name, cpf=$cpf, birthdate=$birthdate, email=$email, zip=$zip, address=$address, number=$number, password=$password}';
  }
}
