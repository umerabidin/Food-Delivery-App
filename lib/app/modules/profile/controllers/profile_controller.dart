import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getx_mvp/app/mixins/loading_mixin.dart';
import 'package:getx_mvp/app/modules/profile/store/store.dart';
import 'package:getx_mvp/app/utils/logout_helper.dart';

class ProfileController extends GetxController with LoadingMixin {
  ProfileController({required this.store, required this.logoutHelper});
  final LogoutHelper logoutHelper;
  final ProfileStore store;

  Future<void> getUserDetails() async {
    const storage = FlutterSecureStorage();

    final email = await storage.read(
      key: 'email',
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );

    final password = await storage.read(
      key: 'password',
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );

    if (email != null) {
      store.email.value = email;
    }
  }

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }

  void onActionLogout() {
    logoutHelper.logout();
  }

  IOSOptions _getIOSOptions() => IOSOptions(accountName: _getAccountName());

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  String? _getAccountName() => 'MvpGetx';
}
