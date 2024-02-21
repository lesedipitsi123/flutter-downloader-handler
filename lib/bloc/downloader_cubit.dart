import 'dart:developer' as dev;

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloaderCubit extends Cubit<int> {
  DownloaderCubit() : super(0);

  static const _hintMethodChannelName =
      "com.bt.studios.apps.downloader_handler_flutter.downloader_handler_flutter/downloader";

  void downloadFile(
      {required String url,
      required String filename,
      required String fileExtension}) async {
    try {
      var downloadId = await const MethodChannel(_hintMethodChannelName)
          .invokeMethod<int>("downloadFile", {
        "url": url,
        "filename": filename,
        "fileExtension": fileExtension
      });

      emit(downloadId ?? -1);
    } on PlatformException catch (e) {
      dev.log("Exception: ${e.message}");
    }
  }
}
