import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart' as GetS;
import 'package:tabuleiro/core/app_binding.dart';
import 'package:tabuleiro/core/storage/get_storage.dart';
import 'package:tabuleiro/core/ui/app_theme.dart';
import 'package:tabuleiro/routes.dart';

Future<void> main() async {
  await GetS.GetStorage.init();
  final token = GetStorage().get("token");
  runApp(MyApp(isAuthenticated: token != null));
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;
  const MyApp({super.key, this.isAuthenticated = false});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tabuleiro',
      theme: AppTheme.theme,
      getPages: Routes().pages,
      initialRoute: isAuthenticated ? '/games' : '/sign',
      initialBinding: AppBinding(),
    );
  }
}
