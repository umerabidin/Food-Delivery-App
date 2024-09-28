import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvp/app/mixins/loading_mixin.dart';
import 'package:getx_mvp/app/modules/signup/store/store.dart';
import 'package:getx_mvp/app/routes/app_pages.dart';
import 'package:getx_mvp/app/utils/validators.dart';
import 'package:getx_mvp/app/widgets/snack_bar.dart';
import 'package:getx_mvp/app/widgets/x_text_field.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController with LoadingMixin {
    SignupController({required this.store});

    final SignUpStore store;

  final formKeySignUp = GlobalKey<FormState>();
final nameFieldData = TextFieldData(
    validator: Validator.alphanumericNotEmptyValidator,
    keyboardType: TextInputType.name,
  );

  final emailFieldData = TextFieldData(
    validator: Validator.emailValidator,
    keyboardType: TextInputType.emailAddress,
  );

  final passwordFieldData =
      TextFieldData(validator: Validator.passwordValidator, isPassword: true);
  
  final numberFieldData =
      TextFieldData(validator: Validator.phoneNumberFormatValidator);
  
  void onSignInClicked() => Get.offAllNamed(Routes.LOGIN);

  Future<void> onActionLoginClicked() async {
    if (!formKeySignUp.currentState!.validate()) {
      return;
    }
    if(store.selectedImage.value == null){
      showErrorSnackbar(message: 'Please select photo');
      return;
    }
    loading.value = true;
    Future.delayed(const Duration(seconds: 3),(){


    Get.offNamed(Routes.LOGIN);
    loading.value = false;
    });
    
  }
Future pickImageGallery() async{
  final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(returnedImage !=null){
    store.selectedImage.value = returnedImage.path;
  }
}
Future captureImage() async{
  final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
  if(returnedImage !=null){
    store.selectedImage.value = returnedImage.path;
  }
}
}
