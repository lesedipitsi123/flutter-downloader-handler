import 'dart:developer' as dev;

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloaderCubit extends Cubit<int> {

  DownloaderCubit(): super(0);

  static const _hintMethodChannelName = "com.bt.studios.apps/downloader";

  void downloadFile({required String url}) async {
    try {
      await const MethodChannel(_hintMethodChannelName)
          .invokeMethod("downloadFile", url);

    } on PlatformException catch (e) {
      dev.log("Exception: ${e.message}");
    }
  }
}