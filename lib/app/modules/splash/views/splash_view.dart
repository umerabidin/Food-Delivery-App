import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:getx_mvp/app/assets/assets.dart';
import 'package:getx_mvp/app/constants/string_constants.dart';
import 'package:getx_mvp/app/modules/splash/controllers/splash_controller.dart';
import 'package:getx_mvp/app/theme/theme.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImageAsset.appLogo)
                .animate()
                .flip(duration: const Duration(seconds: 2))
                .move(),
            Text(
              NameConstant.kAppName,
              style: Get.textTheme.headline2Bold?.copyWith(color: XColors.primary),
            ).animate().fade(delay: const Duration(seconds: 1)).scale(),
          ],
        ),
      ),
    );
  }
}
