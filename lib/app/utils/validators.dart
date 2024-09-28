import 'package:get/get.dart';
import 'package:getx_mvp/app/extensions/string_extention.dart';

class Validator {
  static const _urlPattern =
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9])[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$";

  /// phone Pattern '^\+[1-9]\d{10,14}$'
  static const _phoneNumberPattern = r'^\+[1-9]\d{1,14}$';

  static const _alphanumericPattern = r'^[a-zA-Z0-9 &\-]+$';

  static const _alphabetPattern = '[a-zA-Z]';

  static const _numericPattern = '[0-9]';

  static const _referralCodePattern = r'^[A-Za-z0-9]{1,32}$';

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please input right email format	';
    }

    return _emailFormatValidator(value);
  }

  static String? emailOptionalValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    return _emailFormatValidator(value);
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password field is required';
    }

    final hasDigits = value.contains(RegExp(_numericPattern));
    final hasCharacters = value.contains(RegExp(_alphabetPattern));
    final hasMinLength = value.length >= 8;

    // if (!hasDigits) {
    //   return XString.label_password_must_contains_minimum_one_number;
    // }
    //
    // if (!hasCharacters) {
    //   return XString.label_password_must_contains_minimum_one_letter;
    // }

    if (!hasMinLength) {
      return 'Password must contains minimum 8 characters';
    }

    return null;
  }

  static String? notEmptyValidator(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'The field can\'t be empty';
    }

    return null;
  }


  static String? priceValidatorWithOutMsg(String? value) {
    final trimmedValue = (value ?? '').removeWhiteSpaces;

    if (trimmedValue.isEmpty) {
      return '';
    }

    if (double.parse(trimmedValue.replaceAll('.', '')) > 100000000) {
      return '';
    }

    return null;
  }

  static String? productPriceValidator(String? value, String? message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  static String? alphanumericNotEmptyValidator(String? value) {
    final trimmedValue = (value ?? '').removeWhiteSpaces;

    if (trimmedValue.isEmpty) {
      return 'The field can\'t be empty';
    }

    if (!GetUtils.hasMatch(trimmedValue, _alphanumericPattern)) {
      return 'Please input the right name format';
    }

    return null;
  }

  static String? amountValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'The field can\'t be empty';
    }

    if (!value.replaceAll('.', '').isNumericOnly) {
      return 'Filed can take numeric values only';
    }

    return null;
  }

  static String? phoneNumberFormatValidator(String? value) {
    final phone = value?.removeAllWhitespace;
    if (!GetUtils.hasMatch(phone, _phoneNumberPattern)) return 'Please enter valid phone number';

    return null;
  }

  static String? customNotEmptyValidator(String? value, String? message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  static String? _emailFormatValidator(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Please input right email format';
    }

    return null;
  }
}
