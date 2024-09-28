import 'package:dio/src/dio.dart';
import 'package:getx_mvp/app/data/network_service/network_result.dart';
import 'package:getx_mvp/app/data/network_service/network_service.dart';
import 'package:getx_mvp/app/data/news/model/news_response.dart';

class NewsNetworkService extends NetworkService {
  NewsNetworkService({required Dio dio}) : super(dio: dio);

  String getTransactionDetailsEndpoint =
      'https://jsonplaceholder.typicode.com/posts';

  Future<NetworkResult<List<PostResponse>>> getTransactionList() async {
    final queryParameters = <String, dynamic>{};

    return get<NetworkResult<List<PostResponse>>, List<PostResponse>>(
      getTransactionDetailsEndpoint,
      queryParameters: queryParameters,
      decoder: (data) {
        if (data is List) {
          return data.map((item) => PostResponse.fromJson(item)).toList();
        } else if (data is Map) {
          // If the data is a Map, convert it to Map<String, dynamic>
          final Map<String, dynamic> typedData =
              Map<String, dynamic>.from(data);
          return [PostResponse.fromJson(typedData)];
        } else {
          throw Exception('Invalid data type');
        }
      },
      onSuccess: (response) => NetworkResult.success(response),
      onError: (error) => NetworkResult.error(error?.errorMessage),
    );
  }
}
