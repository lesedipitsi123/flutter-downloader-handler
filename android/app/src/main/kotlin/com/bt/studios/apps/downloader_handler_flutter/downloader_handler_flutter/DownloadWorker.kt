package com.bt.studios.apps.downloader_handler_flutter.downloader_handler_flutter


import android.app.DownloadManager
import android.content.Context
import android.content.Context.DOWNLOAD_SERVICE
import android.net.Uri
import android.os.Environment
import androidx.work.Worker
import androidx.work.WorkerParameters
import androidx.work.workDataOf
import java.io.File
import java.text.SimpleDateFormat
import java.util.Calendar
import java.util.Locale


class DownloadManagerWorker(private val context: Context, params: WorkerParameters) :
    Worker(context, params) {

    override fun doWork(): Result {
        val url = inputData.getString("KeyUrl")
        val filename = inputData.getString("KeyFilename")
        val downloadExtension = inputData.getString("KeyFileExtension")
        val destinationDirectory = createDownloadSubPath(filename, downloadExtension)

        if (url.isNullOrEmpty() || filename.isNullOrEmpty() || downloadExtension.isNullOrEmpty()) {
            return Result.failure()
        }

        try {
            val request = DownloadManager.Request(Uri.parse(url)).apply {
                setTitle(filename)
                setDescription(context.getString(R.string.app_name))
                setDestinationInExternalPublicDir(
                    Environment.DIRECTORY_DOWNLOADS,
                    destinationDirectory
                )
                setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE or DownloadManager.Request.NETWORK_WIFI)
            }

            val downloadManager = context.getSystemService(DOWNLOAD_SERVICE) as DownloadManager

            val downloadId = downloadManager.enqueue(request)


            return Result.success(workDataOf("KeyDownloadId" to downloadId))
        } catch (e: Exception) {

            return Result.failure()
        }
    }

    private fun createDownloadSubPath(filename: String?, fileExtension: String?): String {
        val timestamp = with(Calendar.getInstance()) {
            SimpleDateFormat(
                context.getString(R.string.text_format_date_pattern),
                Locale.getDefault()
            ).format(time)
        }

        val fileName = String.format(
            Locale.getDefault(),
            context.getString(R.string.text_format_file_name),
            filename,
            timestamp,
            fileExtension
        )

        return File.separator + context.getString(R.string.app_name) + File.separator + fileName
    }
}