import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getx_mvp/app/mixins/loading_mixin.dart';
import 'package:getx_mvp/app/routes/app_pages.dart';
import 'package:getx_mvp/app/utils/validators.dart';
import 'package:getx_mvp/app/widgets/x_text_field.dart';

class LoginController extends GetxController with LoadingMixin {
  final formKey = GlobalKey<FormState>();
  final emailFieldData = TextFieldData(
    validator: Validator.emailValidator,
    keyboardType: TextInputType.emailAddress,
  );
  final passwordFieldData =
      TextFieldData(validator: Validator.passwordValidator, isPassword: true);

  void onForgotPasswordClicked() {} //Get.toNamed(Routes.FORGOT_PASSWORD);
  void onSignUpClicked() => Get.offAllNamed(Routes.SIGNUP);
  Future<void> onActionLoginClicked() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    isLoading = true;
    Future.delayed(const Duration(seconds: 3), () async {
      const storage = FlutterSecureStorage();

      await storage.write(
        key: 'email',
        value: emailFieldData.textInField,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );

      await storage.write(
        key: 'password',
        value: passwordFieldData.textInField,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
       Get.offNamed(Routes.MAIN);
          isLoading = false;
    });
   

  }

  IOSOptions _getIOSOptions() => IOSOptions(accountName: _getAccountName());

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  String? _getAccountName() => 'MvpGetx';
}
