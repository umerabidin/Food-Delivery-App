import 'dart:io';

import 'package:get/get.dart';
import 'package:getx_mvp/app/mixins/loading_mixin.dart';

class SignUpStore with LoadingMixin {
  final _selectedImage = Rx<String?>(null);

  Rx<String?> get selectedImage => _selectedImage;
}

class SignUpStoreFactory {
  SignUpStore create() => SignUpStore();
}