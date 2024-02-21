import 'package:downloader_handler_flutter/bloc/downloader_cubit.dart';
import 'package:downloader_handler_flutter/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DownloaderCubit(),
      child: HomeView(),
    );
  }
}
