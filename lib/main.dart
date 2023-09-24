import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cv/core/constants/app_router.dart';
import 'package:my_cv/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Abdalrhman Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      initialRoute: '/',
      getPages: AppRouter.appRouter,
    );
  }
}
