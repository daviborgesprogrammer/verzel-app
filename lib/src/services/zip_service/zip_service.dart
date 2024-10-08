import '../../models/address_model.dart';
import 'zip_service_impl.dart';

abstract interface class ZipService {
  Future<Address> getAddressByZip(String zip);

  factory ZipService() {
    return ZipServiceImpl();
  }
}
