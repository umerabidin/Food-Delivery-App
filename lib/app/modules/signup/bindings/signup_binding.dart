import 'package:get/get.dart';
import 'package:getx_mvp/app/modules/signup/store/store.dart';

import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(
        store: SignUpStoreFactory().create(),
      ),
    );
  }
}
