import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvp/app/theme/theme.dart';


void showErrorSnackbar({required String message, bool showOnBottom = false}) {
  if (Get.isSnackbarOpen == true) return;

  Get.rawSnackbar(
    snackPosition: showOnBottom ? SnackPosition.BOTTOM : SnackPosition.TOP,
    titleText: Row(
      children: [
        const Icon(Icons.error_outline, color: Colors.white),
        const SizedBox(width: 10),
        Text(
          'An error occured',
          style: Get.textTheme.bodyText2Bold?.copyWith(color: Colors.white),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            if (Get.isSnackbarOpen) Get.back();
          },
          child: const Icon(Icons.close, color: Colors.white),
        ),
      ],
    ),
    messageText: Text(
      message,
      style: Get.textTheme.bodyText2?.copyWith(color: Colors.white),
    ).paddingOnly(top: 8),
    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
    borderRadius: 2,
    backgroundColor: XColors.xRed,
    boxShadows: [
      const BoxShadow(
        color: XColors.xGrey,
        spreadRadius: 1,
        blurRadius: 4,
      ),
    ],
    duration: const Duration(seconds: 5),
  );
}

void showNewErrorSnackbar({required String message, bool showOnBottom = false}) {
  if (Get.isSnackbarOpen == true) return;

  Get.rawSnackbar(
    snackPosition: showOnBottom ? SnackPosition.BOTTOM : SnackPosition.TOP,
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          message,
          style: Get.textTheme.bodyText2Bold,
        ),
        GestureDetector(
          onTap: () {
            if (Get.isSnackbarOpen) Get.back();
          },
          child: const Icon(Icons.close),
        ),
      ],
    ),
    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
    borderRadius: 2,
    backgroundColor: XColors.xRed[200]!,
    boxShadows: [
      const BoxShadow(
        color: XColors.xGrey,
        spreadRadius: 1,
        blurRadius: 4,
      ),
    ],
    duration: const Duration(seconds: 5),
  );
}

void showSuccessSnackbar({required String message, bool showOnBottom = false}) {
  if (Get.isSnackbarOpen) return;

  Get.rawSnackbar(
    snackPosition: showOnBottom ? SnackPosition.BOTTOM : SnackPosition.TOP,
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            message,
            style: Get.textTheme.bodyText2Bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (Get.isSnackbarOpen) Get.back();
          },
          child: const Icon(Icons.close),
        ),
      ],
    ),
    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
    borderRadius: 2,
    backgroundColor: XColors.xGreen[200]!,
    boxShadows: [
      const BoxShadow(
        color: XColors.xGrey,
        spreadRadius: 1,
        blurRadius: 4,
      ),
    ],
    duration: const Duration(seconds: 5),
  );
}

void showSuccessSnackbarWidget({required Widget messageWidget, bool showOnBottom = false}) {
  if (Get.isSnackbarOpen) return;

  Get.rawSnackbar(
    snackPosition: showOnBottom ? SnackPosition.BOTTOM : SnackPosition.TOP,
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: messageWidget,
        ),
        GestureDetector(
          onTap: () {
            if (Get.isSnackbarOpen) Get.back();
          },
          child: const Icon(Icons.close),
        ),
      ],
    ),
    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
    borderRadius: 2,
    backgroundColor: XColors.xGreen[200]!,
    boxShadows: [
      const BoxShadow(
        color: XColors.xGrey,
        spreadRadius: 1,
        blurRadius: 4,
      ),
    ],
    duration: const Duration(seconds: 5),
  );
}

void showInfoSnackbar({required String message, bool showOnBottom = false}) {
  if (Get.isSnackbarOpen) return;

  Get.rawSnackbar(
    snackPosition: showOnBottom ? SnackPosition.BOTTOM : SnackPosition.TOP,
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            message,
            style: Get.textTheme.bodyText2Bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (Get.isSnackbarOpen) Get.back();
          },
          child: const Icon(Icons.close),
        ),
      ],
    ),
    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
    borderRadius: 2,
    backgroundColor: XColors.xBlue[200]!,
    boxShadows: [
      const BoxShadow(
        color: XColors.xGrey,
        spreadRadius: 1,
        blurRadius: 4,
      ),
    ],
    duration: const Duration(seconds: 5),
  );
}
