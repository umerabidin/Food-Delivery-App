import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_mvp/app/constants/app_sizes.dart';
import 'package:getx_mvp/app/modules/home/controllers/home_controller.dart';
import 'package:getx_mvp/app/widgets/shadow_container.dart';
import 'package:getx_mvp/app/widgets/x_loading_overlay.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: XLoadingOverlay(
        loading: controller.loading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Column(
            children: [
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.store.allTransactionList.length,
                    itemBuilder: (context, index) {
                      var news = controller.store.allTransactionList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ShadowContainer(
                            child: Text(news.title).paddingAll(5)),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
