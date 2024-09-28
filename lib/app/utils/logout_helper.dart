import 'package:get/get.dart';
import 'package:getx_mvp/app/data/auth/auth_provider.dart';
import 'package:getx_mvp/app/data/user/user_provider.dart';
import 'package:getx_mvp/app/routes/app_pages.dart';
import 'package:getx_mvp/app/utils/secure_storage/secure_storage.dart';

class LogoutHelper {
  LogoutHelper({
    required this.authProvider,
    required this.userProvider,
    
  });

  final UserProvider userProvider;
  final AuthProvider authProvider;


  Future<void> logout() async {
 
    SecureStorage()
      ..deleteValueFromStorage('email')
      ..deleteValueFromStorage('password');
    // authProvider.clearPreferences();
    Get.offAllNamed(Routes.LOGIN);
  }
}
