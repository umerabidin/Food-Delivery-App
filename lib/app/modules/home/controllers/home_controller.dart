import 'package:get/get.dart';
import 'package:getx_mvp/app/mixins/loading_mixin.dart';
import 'package:getx_mvp/app/modules/home/store/news_store.dart';

class HomeController extends GetxController with LoadingMixin{
 HomeController({required this.store});

  final NewsStore store;
 Future<void> getTransactionList() async {
   isLoading = true;
    await store.getTransactionList();
    isLoading = false;
  }
  @override
  void onInit() {
     store.allTransactionList.clear();
    super.onInit();
   

  }
}
