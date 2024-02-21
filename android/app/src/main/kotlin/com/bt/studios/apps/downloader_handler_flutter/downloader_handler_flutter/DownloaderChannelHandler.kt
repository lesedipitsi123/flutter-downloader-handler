package com.bt.studios.apps.downloader_handler_flutter.downloader_handler_flutter

import android.content.Context
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.Observer
import androidx.work.Constraints
import androidx.work.Data
import androidx.work.NetworkType
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.WorkInfo
import androidx.work.WorkManager
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

class DownloaderChannelHandler(private val owner: LifecycleOwner, context: Context) :
    MethodCallHandler {
    private val workManager = WorkManager.getInstance(context)
    private lateinit var channelResult: MethodChannel.Result

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        channelResult = result
        when (call.method) {
            "downloadFile" -> {
                enqueueDownloadWorker(
                    url = call.argument("url"),
                    filename = call.argument("filename"),
                    fileExtension = call.argument("fileExtension")
                )
            }

            else -> {
                channelResult.notImplemented()
            }
        }
    }

    private fun enqueueDownloadWorker(url: String?, filename: String?, fileExtension: String?) {
        val constraints = Constraints.Builder()
            .setRequiredNetworkType(NetworkType.CONNECTED)
            .build()

        val workerRequest = OneTimeWorkRequestBuilder<DownloadManagerWorker>()
            .setConstraints(constraints)
            .setInputData(
                Data.Builder()
                    .putString("KeyUrl", url)
                    .putString("KeyFilename", filename)
                    .putString("KeyFileExtension", fileExtension)
                    .build()
            )
            .build()

        workManager.enqueue(workerRequest)
        workManager.getWorkInfoByIdLiveData(workerRequest.id).observe(owner, Observer {
            if (it?.state == null)
                return@Observer
            when (it.state) {
                WorkInfo.State.SUCCEEDED -> {
                    val downloadId = it.outputData.getInt("KeyDownloadId", -1)
                    channelResult.success(downloadId)
                }

                else -> {
                    val downloadId = it.outputData.getInt("KeyDownloadId", -1)
                    channelResult.error("Code $downloadId", "WorkManager failed to start", "")
                }
            }
        })
    }
}