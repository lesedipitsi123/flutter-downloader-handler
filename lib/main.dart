
import 'package:downloader_handler_flutter/common/routes.dart';
import 'package:downloader_handler_flutter/common/theme.dart';
import 'package:flutter/material.dart';

class FlutterDownloaderApp extends StatelessWidget {
  const FlutterDownloaderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: Routes.routes,
    );
  }
}

void main() async {
  runApp(const FlutterDownloaderApp());
}