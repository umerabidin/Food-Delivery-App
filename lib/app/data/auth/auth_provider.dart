import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthProvider extends GetxService {
  static const _email = 'email';
  IOSOptions get _iOSStorageOptions =>  IOSOptions(
        accountName: _getAccountName(),
      );
 String? _getAccountName() => 'MvpGetx';
  AndroidOptions get _androidStorageOptions => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  final _storage = const FlutterSecureStorage();
  final isAuthorized = false.obs;
  bool isLoginDateSaved = false;

  String? email;
  Future<String?> getToken() async {
    email = await _readStorage(_email);
    _updateAuthorizedState();
    if (email != null) return email;

    return email;
  }

  Future<String?> _readStorage(String key) => _storage.read(
        key: key,
        iOptions: _iOSStorageOptions,
        aOptions: _androidStorageOptions,
      );
      void _updateAuthorizedState() {
      
    isAuthorized.value = email != null;
      print('isAuthrized: ${isAuthorized.value}');
  }

}
