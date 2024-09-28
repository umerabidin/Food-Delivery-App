import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_mvp/app/extensions/string_extention.dart';
import 'package:getx_mvp/app/theme/colors.dart';
import 'package:getx_mvp/app/utils/capatalized_text_formatter.dart';


class TextFieldData {
  TextFieldData({
    this.isPassword = false,
    this.isClear = false,
    this.onChanged,
    this.onFieldSubmit,
    this.validator,
    this.keyboardType = TextInputType.text,
    String? initValue,
    this.maxLength,
    List<TextInputFormatter> formatters = const [],
    this.textCapitalization = TextCapitalization.sentences,
    this.optionPosition = const [0],
  })  : controller = TextEditingController(text: initValue),
        _formatters = isPassword || textCapitalization != TextCapitalization.sentences || keyboardType != TextInputType.text
            ? formatters
            : [...formatters, CapitalizeSentenceCaseTextFormatter()] {
    if (initValue != null) _counterText.value = initValue.length;
  }

  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final List<TextInputFormatter> _formatters;
  final bool isClear;
  final TextEditingController controller;
  final errorText = ''.obs;
  final passwordVisible = false.obs;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmit;
  List<int> optionPosition;

  final _counterText = 0.obs;

  String? get error => errorText.value.nullIfEmpty;

  bool get obscureText => isPassword && !passwordVisible.value;

  String get textInField => controller.text;

  List<TextInputFormatter> get formatters => _formatters;

  int get counterText => _counterText.value;

  set counterText(int newLength) => _counterText.value = newLength;

  set textInField(String newText) {
    controller
      ..text = newText
      ..selection = TextSelection.collapsed(offset: newText.length);
  }

  void togglePasswordVisible() {
    passwordVisible.value = !passwordVisible.value;
  }
}


class MTextField extends StatelessWidget {
  const MTextField({
    required this.hintText,
    required this.fieldData,
    this.maxLines = 1,
    this.prefix,
    this.suffix,
    Key? key,
    this.isEnabled = true,
    this.filledColor = Colors.white,
    this.showCounterText = true,
    this.onTapAction,
    this.errorHeight = 1,
    this.enableInteractiveSelection = true,
    this.focusNode,
    this.infoLabel,
    this.textAlign = TextAlign.left,
    this.textStyle,
  }) : super(key: key);

  final String hintText;
  final TextFieldData fieldData;
  final int? maxLines;
  final Widget? prefix;
  final Widget? suffix;
  final bool isEnabled;
  final Color? filledColor;
  final bool showCounterText;
  final VoidCallback? onTapAction;
  final double errorHeight;
  final bool enableInteractiveSelection;
  final FocusNode? focusNode;
  final String? infoLabel;
  final TextAlign textAlign;
  final TextStyle? textStyle;

  OutlineInputBorder get _border => OutlineInputBorder(
        borderSide: BorderSide(
          color: XColors.xGrey[300]!,
        ),
      );

  Color get _filledColor {
    return isEnabled ? filledColor ?? Colors.white : XColors.xGrey[100]!;
  }

  TextStyle? get _textStyle {
    if (!isEnabled) {
      return Get.textTheme.bodyText2?.copyWith(
        color: XColors.xBlack[200],
        fontWeight: FontWeight.w400,
      );
    }

    if (textStyle != null) return textStyle;

    return Get.textTheme.bodyText2?.copyWith(
      color: isEnabled ? XColors.xBlack : XColors.xBlack[200],
      fontWeight: FontWeight.w400,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(buildTextFormField);
  }

  @protected
  Widget buildTextFormField() {
    return TextFormField(
      textAlign: textAlign,
      textCapitalization: fieldData.textCapitalization,
      controller: fieldData.controller,
      validator: fieldData.validator,
      obscureText: fieldData.obscureText,
      keyboardType: fieldData.keyboardType,
      maxLines: maxLines,
      maxLength: fieldData.maxLength,
      inputFormatters: fieldData.formatters,
      readOnly: !isEnabled,
      onTap: onTapAction,
      onFieldSubmitted: (text) {
        if (fieldData.onFieldSubmit != null) fieldData.onFieldSubmit!(text);
      },
      onChanged: (text) {
        fieldData.counterText = text.length;
        if (fieldData.onChanged != null) fieldData.onChanged!(text);
      },
      enableInteractiveSelection: enableInteractiveSelection,
      // will disable paste operation
      focusNode: focusNode,
      style: _textStyle,
      decoration: InputDecoration(
        errorStyle: TextStyle(height: errorHeight),
        labelText: hintText,
        hintStyle: TextStyle(color: XColors.xGrey[400]),
        floatingLabelStyle: const TextStyle(color: XColors.xGreen),
        fillColor: _filledColor,
        filled: true,
        errorText: fieldData.error,
        errorMaxLines: 2,
        prefixIcon: prefix,
        prefixIconConstraints: const BoxConstraints(),
        suffix: suffix != null ? null : const SizedBox(width: 15),
        suffixIcon: fieldData.isPassword
            ? IconButton(
                icon: Icon(fieldData.passwordVisible.value ? Icons.visibility : Icons.visibility_off),
                onPressed: fieldData.togglePasswordVisible,
              )
            : fieldData.isClear
                ? IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 20,
                      color: XColors.xBlack[400],
                    ),
                    onPressed: () {
                      fieldData.controller.clear();
                      if (fieldData.onChanged != null) {
                        fieldData.onChanged!('');
                      }
                    },
                  )
                : null,
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        focusedBorder: _border,
        enabledBorder: _border,
        counterText: showCounterText ? null : '',
      ),
    );
  }
}