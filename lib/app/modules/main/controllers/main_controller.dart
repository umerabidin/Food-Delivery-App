import 'package:get/get.dart';
import 'package:getx_mvp/app/mixins/loading_mixin.dart';
import 'package:getx_mvp/app/modules/home/controllers/home_controller.dart';

enum SelectedTab { home, profile, notification, other }

class MainController extends GetxController with LoadingMixin {
  final selectedTab = SelectedTab.home.obs;
  @override
  void onInit() {
    super.onInit();
    makeNetworkCalls();
  }

  Future<void> makeNetworkCalls() async {
    Get.find<HomeController>().getTransactionList();
  }

  void onHomePressed() => selectedTab.value = SelectedTab.home;
  void onMyProfilePressed() => selectedTab.value = SelectedTab.profile;
}
