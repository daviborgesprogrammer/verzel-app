import 'storage_impl.dart';

abstract interface class Storage {
  Future<void> setData(String key, String value);
  Future<String?> getData(String key);
  void clean();
  factory Storage() => StorageImpl();
}
