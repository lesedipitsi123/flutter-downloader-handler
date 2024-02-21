import 'package:downloader_handler_flutter/ui/home_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String home = "/home";

  static final routes = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
