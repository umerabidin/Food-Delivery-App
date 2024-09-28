import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvp/app/constants/string_constants.dart';
import 'package:getx_mvp/app/theme/theme.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({required this.clickActionHandle, Key? key}) : super(key: key);

  final VoidCallback clickActionHandle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Get.textTheme.bodyText3,
        children: [
          const TextSpan(text: NameConstant.kForgotYourPass),
          TextSpan(
            style: Get.textTheme.buttonTextExtraSmall.copyWith(
              color: XColors.primary,
              decoration: TextDecoration.underline,
            ),
            text: ' ${NameConstant.kResetPass}',
            recognizer: TapGestureRecognizer()..onTap = clickActionHandle,
          ),
        ],
      ),
    );
  }
}
