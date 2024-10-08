// ignore_for_file: public_member_api_docs, sort_constructors_first

class Address {
  String? zipCode;
  String? publicPlace;
  String? neighborhood;
  String? state;
  String? number;
  Address({
    this.zipCode,
    this.publicPlace,
    this.neighborhood,
    this.state,
    this.number,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'zipCode': zipCode,
      'publicPlace': publicPlace,
      'neighborhood': neighborhood,
      'state': state,
      'number': number,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      zipCode: map['zipCode'] != null ? map['zipCode'] as String : null,
      publicPlace:
          map['publicPlace'] != null ? map['publicPlace'] as String : null,
      neighborhood:
          map['neighborhood'] != null ? map['neighborhood'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      number: map['number'] != null ? map['number'] as String : null,
    );
  }

  factory Address.fromData(Map<String, dynamic> map) {
    return Address(
      zipCode: map['cep'] != null ? map['cep'] as String : null,
      publicPlace:
          map['logradouro'] != null ? map['logradouro'] as String : null,
      neighborhood: map['bairro'] != null ? map['bairro'] as String : null,
      state: map['estado'] != null ? map['estado'] as String : null,
    );
  }
}
