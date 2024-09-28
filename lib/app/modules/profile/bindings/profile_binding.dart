import 'package:get/get.dart';
import 'package:getx_mvp/app/modules/profile/store/store.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(
        store: ProfileStoreFactory().create(),
        logoutHelper: Get.find(),
      ),
    );
  }
}
