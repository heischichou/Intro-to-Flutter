
import 'package:flutter_intro/models/storage_item.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AndroidOptions _androidOptions() =>
    const AndroidOptions(encryptedSharedPreferences: true);
  // Create
  Future<void> store(StorageItem item) async {
    await _secureStorage.write(key: item.key, value: item.value, aOptions: _androidOptions());
  }
  
  // Read
  Future<String?> read(String key) async {
    return await _secureStorage.read(key: key, aOptions: _androidOptions());
  }

  // Read All
  Future<List<StorageItem>> readAll() async {
    final Map<String, String> data = await _secureStorage.readAll(aOptions: _androidOptions());

    List<StorageItem> items = 
      data.entries.map((e) => StorageItem(e.key, e.value)).toList();

    return items;
  }

  // Update
  Future<void> update(String key, String value) async {
    await _secureStorage.write(key: key, value: value, aOptions: _androidOptions());
  }

  // Delete
  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key, aOptions: _androidOptions());
  }

  // Delete All
  Future<void> deleteAll() async {
    await _secureStorage.deleteAll(aOptions: _androidOptions());
  }
}