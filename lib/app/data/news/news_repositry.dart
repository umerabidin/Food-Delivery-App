import 'package:getx_mvp/app/data/network_service/network_result.dart';
import 'package:getx_mvp/app/data/news/model/news_response.dart';
import 'package:getx_mvp/app/data/news/news_network_service.dart';


class NewsRepository {
  NewsRepository({required this.newsNetworkService});

  final NewsNetworkService newsNetworkService;

  Future<NetworkResult<List<PostResponse>>> getTransactionList() async {
    var data = newsNetworkService.getTransactionList();
    return  data;
  }
}
