import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:getx_mvp/app/data/models/error_response.dart';
import 'package:getx_mvp/app/utils/app_logging_events.dart';
import 'package:path_provider/path_provider.dart';

typedef Decoder<R> = R Function(Map<String, dynamic> data);
typedef Decoder2<R> = R Function(dynamic data);
typedef OnSuccess<R, T> = R Function(T response);
typedef OnError<R> = R Function(ErrorResponse? response);

abstract class NetworkService extends g.GetxService {
  NetworkService({required this.dio});

  final Dio dio;
  final appLoggingEvent = AppLoggingEvents();

  Future<Result> post<Result, Resp>(
    String endpoint, {
    bool isFormData = false,
    required Map<String, dynamic> body,
    required Decoder<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      if (endpoint.contains('instructor_token')) {
        dio.options.headers.removeWhere((key, value) => key == 'Authorization');
      }

      final requestData = isFormData ? FormData.fromMap(body) : body;
      final response = await dio.post(dio.options.baseUrl + endpoint, data: requestData);
      final decodedResponse = decoder(response.data as Map<String, dynamic>);
      appLoggingEvent.combineLoggingEvent(
        heading: dio.options.baseUrl + endpoint,
        loggerName: 'POST',
        sendingResponse: json.encode(body),
        apiResponse: response.data.toString(),
      );
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } on Exception catch (error) {
      error.printError();
      return onError(ErrorResponse(message: 'Internal Error'));
    } finally {}
  }

  ///when receiving body in post object
  Future<Result> postObject<Result, Resp>(
    String endpoint, {
    bool isFormData = false,
    required Object body,
    required Decoder<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      final requestData = body;
      final response = await dio.post(dio.options.baseUrl + endpoint, data: requestData);
      final decodedResponse = decoder(response.data as Map<String, dynamic>);
      appLoggingEvent.combineLoggingEvent(
        heading: dio.options.baseUrl + endpoint,
        loggerName: 'POST',
        sendingResponse: json.encode(body),
        apiResponse: response.data.toString(),
      );
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } on Exception catch (error) {
      error.printError();
      return onError(ErrorResponse(message: 'Internal Error'));
    } finally {}
  }

  /// when receiving a list of objects in post request
  Future<Result> postDynamicResult<Result, Resp>(
    String endpoint, {
    required Map<String, dynamic> body,
    required Decoder2<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      final requestData = body;
      final response = await dio.post(dio.options.baseUrl + endpoint, data: requestData);
      final decodedResponse = decoder(response.data);
      appLoggingEvent.combineLoggingEvent(
        heading: dio.options.baseUrl + endpoint,
        loggerName: 'POST',
        sendingResponse: json.encode(body),
        apiResponse: response.data.toString(),
      );
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } on Exception catch (error) {
      error.printError();
      return onError(ErrorResponse(message: 'Internal Error'));
    } finally {}
  }

  Future<Result> postDynamic<Result, Resp>(
    String endpoint, {
    required List<dynamic> body,
    required Decoder2<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      final requestData = body;
      final response = await dio.post(dio.options.baseUrl + endpoint, data: requestData);
      final decodedResponse = decoder(response.data);
      appLoggingEvent.combineLoggingEvent(
        heading: dio.options.baseUrl + endpoint,
        loggerName: 'POST',
        sendingResponse: json.encode(body),
        apiResponse: response.data.toString(),
      );
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } on Exception catch (error) {
      error.printError();
      return onError(ErrorResponse(message: 'Internal Error'));
    } finally {}
  }

  Future<Result> getMap<Result, Resp>(
    String endpoint, {
    required Decoder<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(endpoint, queryParameters: queryParameters);
      final decodedResponse =response.data;
     
      return onSuccess(decodedResponse);
    } on DioException catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } finally {}
  }

  Future<Result> get<Result, Resp>(
    String endpoint, {
    required Decoder2<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(endpoint, queryParameters: queryParameters);
      final decodedResponse = decoder(response.data);
     
      return onSuccess(decodedResponse);
    } on DioException catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } on Exception catch (error) {
      error.printError();
      return onError(
        ErrorResponse(
          errorCode: '',
          message: 'Internal Error',
        ),
      );
    } finally {}
  }

  Future<Result> patch<Result, Resp>(
    String endpoint, {
    required Map<String, dynamic> body,
    required Decoder<Resp> decoder,
    bool isFormData = false,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      final requestData = isFormData ? FormData.fromMap(body) : body;
      final response = await dio.patch(endpoint, data: requestData);
      final decodedResponse = decoder(response.data as Map<String, dynamic>);
      appLoggingEvent.combineLoggingEvent(
        heading: dio.options.baseUrl + endpoint,
        loggerName: 'PATCH',
        sendingResponse: body.toString(),
        apiResponse: response.data.toString(),
      );
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } finally {}
  }

  Future<Result> patchDynamic<Result, Resp>(
    String endpoint, {
    required Map<String, dynamic> body,
    required Decoder2<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      final response = await dio.patch(endpoint, data: body);
      final decodedResponse = decoder(response.data);
      appLoggingEvent.combineLoggingEvent(
        heading: dio.options.baseUrl + endpoint,
        loggerName: 'PATCH',
        sendingResponse: body.toString(),
        apiResponse: response.data.toString(),
      );
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } finally {}
  }

  Future<Result> put<Result, Resp>(
    String endpoint, {
    required Map<String, dynamic> body,
    required Decoder<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      final response = await dio.put(endpoint, data: body);
      final decodedResponse = decoder(response.data as Map<String, dynamic>);
      appLoggingEvent.combineLoggingEvent(
        heading: dio.options.baseUrl + endpoint,
        loggerName: 'PUT',
        sendingResponse: body.toString(),
        apiResponse: response.data.toString(),
      );
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } finally {}
  }

  Future<Result> delete<Result, Resp>(
    String endpoint, {
    Map<String, dynamic>? body,
    required Decoder<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      final response = await dio.delete(endpoint, data: body);
      final decodedResponse = decoder(response.data as Map<String, dynamic>);
      appLoggingEvent.combineLoggingEvent(
        heading: dio.options.baseUrl + endpoint,
        loggerName: 'Delete',
        sendingResponse: body.toString(),
        apiResponse: response.data.toString(),
      );
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } finally {}
  }

  Future<Result> deleteDynamic<Result, Resp>(
    String endpoint, {
    Map<String, dynamic>? body,
    required Decoder2<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      final response = await dio.delete(endpoint, data: body);
      final decodedResponse = decoder(response.data);
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } finally {}
  }

  Future<Result> uploadFile<Result, Resp>(
    String endpoint, {
    required File file,
    required Decoder<Resp> decoder,
    required OnSuccess<Result, Resp> onSuccess,
    required OnError<Result> onError,
  }) async {
    try {
      final fileName = file.path.split('/').last;
      final requestData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path, filename: fileName),
      });
      final response = await dio.post(dio.options.baseUrl + endpoint, data: requestData);
      final decodedResponse = decoder(response.data as Map<String, dynamic>);
      return onSuccess(decodedResponse);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } on Exception catch (error) {
      error.printError();
      return onError(ErrorResponse(message: 'Internal Error'));
    } finally {}
  }

  Future<Result> downloadFile<Result, Resp>(
    String endpoint, {
    required String fileName,
    required OnSuccess<Result, File> onSuccess,
    required OnError<Result> onError,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await dio.get(endpoint, queryParameters: queryParameters, options: Options(responseType: ResponseType.bytes));
      final appDir =
          Platform.isAndroid ? await getExternalStorageDirectory() : await getApplicationDocumentsDirectory();

      final tempPath = appDir!.path;
      final file = File('$tempPath/$fileName');

      await file.create();

      await file.writeAsBytes(response.data as List<int>);

      return onSuccess(file);
    } on DioError catch (error) {
      return _handleError(
        error,
        onError: onError,
      );
    } finally {}
  }

  Result _handleError<Result>(
    DioError error, {
    required OnError<Result> onError,
  }) {
    if (error.error is SocketException) return onError(ErrorResponse(message: 'Internet Connection'));

    if (error.type == DioExceptionType.connectionTimeout) {
      return onError(ErrorResponse(message: 'Internet Connection'));
    }

    if (error.response == null) return onError(null);

    if (error.response!.data is String) {
      final errorResponse = ErrorResponse(message: error.response!.data as String);
      return onError(errorResponse);
    }

    final errorResponse = ErrorResponse.fromJson(error.response!.data as Map<String, dynamic>);
    return onError(errorResponse);
  }
}
