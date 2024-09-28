import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_mvp/app/data/auth/auth_provider.dart';
import 'package:getx_mvp/app/data/news/news_network_service.dart';
import 'package:getx_mvp/app/data/news/news_repositry.dart';
import 'package:getx_mvp/app/data/user/user_provider.dart';
import 'package:getx_mvp/app/modules/splash/controllers/splash_controller.dart';
import 'package:getx_mvp/app/utils/logout_helper.dart';
import 'package:getx_mvp/xapp.dart';


void main() {
  final authProvider = AuthProvider();
 final dio = Dio(BaseOptions(
      // baseUrl: Config.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept-Charset': 'utf-8',
      },
    ));
    final userProvider = UserProvider(
      authProvider: authProvider,
  
    );
    Get
    ..put(SplashController())
    ..put(userProvider)
    ..put(authProvider)
    ..put(LogoutHelper(
        authProvider: authProvider,
        userProvider: userProvider,
      ))
    ..put(NewsRepository(newsNetworkService: NewsNetworkService(dio: dio)));
  runApp(
    const XApp(),
  );
}
