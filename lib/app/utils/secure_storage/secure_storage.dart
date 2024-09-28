import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{

  final storage = const FlutterSecureStorage();

  saveValueInSecureStorage(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  deleteAllStorages() async{
    await storage.deleteAll();
  }

  deleteValueFromStorage(String key) async {
    await storage.delete(key: key, iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),);
  }

  Future<String?> readValueFromSecureStorage(String key) async{
    String? value = await storage.read(key: key);
    return value;
  }
   IOSOptions _getIOSOptions() => IOSOptions(accountName: _getAccountName());

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  String? _getAccountName() => 'MvpGetx';

}