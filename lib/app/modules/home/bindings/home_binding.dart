import 'package:get/get.dart';
import 'package:getx_mvp/app/modules/home/controllers/home_controller.dart';
import 'package:getx_mvp/app/modules/home/store/news_store.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        store: NewsStoreFactory().create(),
      ),
    );
  }
}
