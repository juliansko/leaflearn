import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

final _secureStorage = FlutterSecureStorage(aOptions: _getAndroidOptions());

Future<void> writeSecure(String key, String value) async {
  await _secureStorage.write(key: key, value: value);
}

Future<String?> readSecure(String key) async {
  return await _secureStorage.read(key: key);
}

Future<void> deleteSecure(String key) async {
  await _secureStorage.delete(key: key);
}
