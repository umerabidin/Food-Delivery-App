import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:getx_mvp/app/assets/assets.dart';
import 'package:getx_mvp/app/constants/app_sizes.dart';
import 'package:getx_mvp/app/constants/string_constants.dart';
import 'package:getx_mvp/app/modules/login/controllers/login_controller.dart';
import 'package:getx_mvp/app/widgets/button.dart';
import 'package:getx_mvp/app/modules/login/widgets/create_account.dart';
import 'package:getx_mvp/app/modules/login/widgets/forgot_password.dart';
import 'package:getx_mvp/app/theme/colors.dart';
import 'package:getx_mvp/app/widgets/x_loading_overlay.dart';
import 'package:getx_mvp/app/widgets/x_text_field.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return XLoadingOverlay(
      loading: controller.loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              gapH120,
              Image.asset(
                ImageAsset.appLogo,
                height: Sizes.p120,
                width: Sizes.p120,
              ).animate().flipV(duration: const Duration(seconds: 2)).move(),
              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      NameConstant.kSignIn,
                      style: Get.textTheme.headlineMedium?.copyWith(
                          color: XColors.xBlack, fontWeight: FontWeight.w700),
                    ),
                    gapH16,
                    Text(
                      NameConstant.kPleaseLogin,
                      style: Get.textTheme.titleSmall?.copyWith(
                          color: XColors.xGrey[800],
                          fontWeight: FontWeight.w400),
                    ),
                    gapH32,
                    MTextField(
                      fieldData: controller.emailFieldData,
                      hintText: 'Email',
                    ),
                    gapH16,
                    MTextField(
                      fieldData: controller.passwordFieldData,
                      hintText: 'Password',
                    ),
                    gapH32,
                    Button.primary(
                      color: XColors.xGreen[500],
                      onPressed: controller.onActionLoginClicked,
                      child: const Text(NameConstant.kLogin),
                    ),
                    gapH32,
                    Align(
                      child: CreateAcount(
                        clickActionHandle: controller.onSignUpClicked,
                      ),
                    ),
                    gapH16,
                    Align(
                      child: ForgotPassword(
                        clickActionHandle: controller.onForgotPasswordClicked,
                      ),
                    ),
                  ],
                ),
              ).paddingSymmetric(horizontal: 24),
            ],
          ),
        ),
      ),
    );
  }
}
