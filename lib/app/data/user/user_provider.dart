
import 'package:get/get.dart';
import 'package:getx_mvp/app/data/auth/auth_provider.dart';
import 'package:getx_mvp/app/mixins/loading_mixin.dart';

class UserProvider extends GetxController{
  UserProvider({
    required this.authProvider,
  });


  final AuthProvider authProvider;

  @override
  void onInit() {
    super.onInit();
    loadInstructorProfileLocally();
  }

 
   Future<void> loadInstructorProfileLocally() async {
    if (await authProvider.getToken() != null) {
      
    }
  }
 
}
