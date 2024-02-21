package com.bt.studios.apps.downloader_handler_flutter.downloader_handler_flutter

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        handlePhoneHintMethodChannel(flutterEngine)
    }

    private fun handlePhoneHintMethodChannel(flutterEngine: FlutterEngine) {
        val handler = DownloaderChannelHandler(this, this)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, downloaderChannel)
            .setMethodCallHandler(handler)
    }

    companion object {
        private const val downloaderChannel =
            "com.bt.studios.apps.downloader_handler_flutter.downloader_handler_flutter/downloader"
    }
}
