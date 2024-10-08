import 'dart:developer';

import 'package:dio/dio.dart';

import '../core/exceptions/repository_exceptions.dart';
import '../core/rest_client/rest_client.dart';
import '../models/address_model.dart';
import './zip_repository.dart';

class ZipRepositoryImpl implements ZipRepository {
  final RestClient restClient = RestClient();
  @override
  Future<Address> getAddressByZip(String zip) async {
    try {
      final Response(:data) =
          await restClient.get('https://viacep.com.br/ws/$zip/json/');
      return Address.fromData(data);
    } on DioException catch (e, s) {
      log('Erro ao buscar endereço', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar endereço');
    }
  }
}
