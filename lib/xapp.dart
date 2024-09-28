
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_mvp/app/theme/theme.dart';

import 'app/routes/app_pages.dart';

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
class XApp extends StatefulWidget {
  const XApp({super.key});

  @override
  State<XApp> createState() => _XAppState();
}

class _XAppState extends State<XApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ModelProject',
      initialRoute:AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.noTransition,
      theme: appTheme,
      themeMode: ThemeMode.light,
      navigatorObservers: <NavigatorObserver>[routeObserver],
      onUnknownRoute: (_) {
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Ups! No route defined for this flow!!!')),
          ),
        );
      },
    );
  }
    // String _getInitialRoute() => authProvider.isAuthorized.value ? Routes.Main : AppPages.INITIAL;

}