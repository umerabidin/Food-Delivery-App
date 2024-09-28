import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_mvp/app/constants/app_sizes.dart';
import 'package:getx_mvp/app/routes/app_pages.dart';
import 'package:getx_mvp/app/widgets/shadow_container.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body:  Obx(()=>
         Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Row(children: [Text('user email:'), Text(controller.store.email.value)],),
            gapH12,
            IconButton(onPressed: (){
              showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Logout'),
              content: const Text('Are you sure you want to logout?'),
              actions: [
                InkWell(
                  onTap: controller.onActionLogout,
                  child: const Text('Okay').paddingSymmetric(horizontal: 8, vertical: 4),
                ),
              ],
            ),
          );
              
            }, icon: const Row(children: [
              Icon(Icons.logout_outlined),
              gapW4,
              Text('Logout')
            ],)),
            
          ],),
        ),
      )
    );
  }
}
