
import 'package:get/get.dart';
import 'package:getx_mvp/app/data/auth/auth_provider.dart';
import 'package:getx_mvp/app/routes/app_pages.dart';

class SplashController extends GetxController {
  
  @override
  void onReady() {
    super.onReady();
        Future.delayed(const Duration(seconds: 5), () {
       final isAuthrized = Get.find<AuthProvider>().isAuthorized();
      Get.offAndToNamed(isAuthrized? Routes.MAIN :
        Routes.LOGIN);
    });
  }
  
}
