import '../models/address_model.dart';
import 'zip_repository_impl.dart';

abstract interface class ZipRepository {
  Future<Address> getAddressByZip(String zip);

  factory ZipRepository() {
    return ZipRepositoryImpl();
  }
}
