import 'package:downloader_handler_flutter/bloc/downloader_cubit.dart';
import 'package:downloader_handler_flutter/common/dimens.dart';
import 'package:downloader_handler_flutter/ui/widgets/text_input_underline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final TextEditingController textInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloaderCubit, int>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text("Flutter Downloader",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w500)),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await context.read<DownloaderCubit>().downloadFile(
                  url: textInputController.text,
                  filename: "test",
                  fileExtension: "pdf");

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(state != -1
                    ? showDownloadSnackBar(context)
                    : showErrorSnackBar(context));
              }
            },
            icon: Icon(Icons.download_for_offline_outlined,
                size: 18.0,
                color: Theme.of(context).colorScheme.inverseSurface),
            label: Text("Download PDF",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    fontWeight: FontWeight.w500))),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              spacerColumn48px,
              Row(
                children: [
                  Icon(Icons.info_outline,
                      size: 18.0,
                      color: Theme.of(context).colorScheme.inverseSurface),
                  spacerRow8px,
                  Text("Please enter a download link",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontWeight: FontWeight.normal))
                ],
              ),
              spacerColumn16px,
              TextInputUnderline(
                  textFieldLinkController: textInputController,
                  labelText: "Link")
            ],
          ),
        ),
      );
    });
  }

  SnackBar showDownloadSnackBar(BuildContext context) {
    return SnackBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      content: Text(
        "Download started...",
        style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  SnackBar showErrorSnackBar(BuildContext context) {
    return SnackBar(
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      content: Text(
        "Error occurred",
        style: TextStyle(
            color: Theme.of(context).colorScheme.onErrorContainer,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
