// import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';

class AppLoggingEvents {
  Future<void> combineLoggingEvent({
    required String heading,
    required String loggerName,
    String? sendingResponse = '',
    String? apiResponse = '',
    Map<String, dynamic>? attributes,
  }) async {
    // final ddLogger = DatadogSdk.instance.createLogger(LoggingConfiguration(loggerName: loggerName));

    if (sendingResponse!.isNotEmpty) {
      final response = <String, dynamic>{'Sending Response': sendingResponse};
      // ddLogger.info(heading, attributes: response);
    }
    // if (apiResponse!.isNotEmpty) {
    //   ddLogger.addTag('Api Response=>', apiResponse);
    // }
  }
}
