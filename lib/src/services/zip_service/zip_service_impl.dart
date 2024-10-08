import '../../models/address_model.dart';
import '../../repositories/zip_repository.dart';
import './zip_service.dart';

class ZipServiceImpl implements ZipService {
  @override
  Future<Address> getAddressByZip(String zip) async {
    final sanitizedZip = zip.replaceAll(RegExp('[^0-9]'), '');
    return ZipRepository().getAddressByZip(sanitizedZip);
  }
}
