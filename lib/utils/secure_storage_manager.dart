import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class BaseSecureStorageManager {
  static const KEY_TOKEN = 'TOKEN';

  Future<bool> hasToken();
  Future<String?> getToken();
  Future<void> deleteAll();
  Future<void> deleteToken();
  Future<String?> read({required String key});
  Future<void> write({required String key, required String value});
  Future<void> delete({required String key});
  Future<void> deleteAuthSession();
}

class SecureStorageManager implements BaseSecureStorageManager {
  SecureStorageManager._();

  static final SecureStorageManager _instance = SecureStorageManager._();

  static SecureStorageManager get instance => _instance;
  
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> deleteAll() {
    return _storage.deleteAll();
  }

  @override
  Future<void> deleteToken() {
    return _storage.delete(key: BaseSecureStorageManager.KEY_TOKEN);
  }

  @override
  Future<String?> getToken() {
    return _storage.read(key: BaseSecureStorageManager.KEY_TOKEN);
  }

  @override
  Future<bool> hasToken() async {
    final val = await _storage.read(key: BaseSecureStorageManager.KEY_TOKEN);
    return val != null;
  }

  @override
  Future<String?> read({required String key}) {
    return _storage.read(key: key);
  }

  @override
  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<void> delete({required String key}) {
    return _storage.delete(key: key);
  }

  @override
  Future<void> deleteAuthSession() async {
    await _storage.delete(key: BaseSecureStorageManager.KEY_TOKEN);
  }
}