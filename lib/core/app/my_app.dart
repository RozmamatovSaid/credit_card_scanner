import 'package:card_scan_app/core/constants/app_strings.dart';
import 'package:card_scan_app/core/routes/routes.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.routes,
      title: AppStrings.appTitle,
    );
  }
}
