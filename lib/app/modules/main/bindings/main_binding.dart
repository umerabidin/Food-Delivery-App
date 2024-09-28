import 'package:get/get.dart';
import 'package:getx_mvp/app/modules/home/controllers/home_controller.dart';
import 'package:getx_mvp/app/modules/profile/controllers/profile_controller.dart';
import 'package:getx_mvp/app/modules/home/store/news_store.dart';
import 'package:getx_mvp/app/modules/profile/store/store.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get
    ..lazyPut<MainController>(
      () => MainController(),
    )
    ..lazyPut<HomeController>(() => HomeController(
       store: NewsStoreFactory().create(),
    ),)
    ..lazyPut<ProfileController>(() => ProfileController(
      store: ProfileStoreFactory().create(),
      logoutHelper: Get.find(),
      
    ));
  }
}
