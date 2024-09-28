import 'package:get/get.dart';
import 'package:getx_mvp/app/data/news/model/news_response.dart';
import 'package:getx_mvp/app/data/news/news_repositry.dart';
import 'package:getx_mvp/app/mixins/loading_mixin.dart';
import 'package:getx_mvp/app/widgets/snack_bar.dart';

class NewsStore with LoadingMixin {
  final NewsRepository repository;
  NewsStore({required this.repository});

  final _allTransactionList = RxList<PostResponse>([]);

  RxList<PostResponse> get allTransactionList => _allTransactionList;

  Future<void> getTransactionList() async {
    allTransactionList.clear();

    final result = await repository.getTransactionList();

    result.when(
      success: (payload) {
        if (payload != null) {
          allTransactionList.value = payload;
        }
      },
      error: (message) {
        showErrorSnackbar(message: 'An error occurred');
      },
    );
  }
}

class NewsStoreFactory {
  NewsStore create() => NewsStore(
        repository: Get.find(),
      );
}
