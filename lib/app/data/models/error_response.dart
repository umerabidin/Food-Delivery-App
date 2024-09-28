class ErrorResponse {
  ErrorResponse({this.errorCode, required this.message, this.errors});

  ErrorResponse.fromJson(Map<String, dynamic> json)
      : errorCode = json['stat_code'] as String?,
        message = json['message'] as String?,
        errors =
            (json['errors'] as List<dynamic>?)?.map((e) => ErrorModule.fromJson(e as Map<String, dynamic>)).toList();

  final String? errorCode;
  final String? message;
  final List<ErrorModule>? errors;

  String? get errorMessage {
    if (errors == null || errorCode == null) return message;

    switch (errorCode) {
      case ErrorCode.apiValidationError:
        return _parseValidationsError(errors: errors!);
      default:
        return message;
    }
  }

  String _parseValidationsError({required List<ErrorModule> errors}) {
    final totalMessages = <String>[];

    for (final module in errors) {
      /// example ".body.recipient.phone_number"
      final key = module.path.split('.').last;
      final message = module.message;

      totalMessages.add('$key : $message');
    }

    return 'Validation Error :\n${totalMessages.join('\n')}';
  }
}

class ErrorModule {
  ErrorModule({required this.path, required this.message});

  ErrorModule.fromJson(Map<String, dynamic> json)
      : path = json['path'] as String,
        message = json['message'] as String;

  final String path;
  final String message;
}

class ErrorCode {
  static const String apiValidationError = 'API_VALIDATION_ERROR';
  static const String authError = 'AUTHENTICATION_ERROR';
  static const String invalidStoreUrlError = 'INVALID_STORE_URL';
  static const String userLockedError = 'USER_LOCKED_ERROR';
}
