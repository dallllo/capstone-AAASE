
import 'package:flutter_app/features/chat/presentation/pages/chat_page.dart';
import 'package:flutter_app/features/upload/presentation/pages/upload_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/upload',
    routes: [
      GoRoute(
        path: '/upload',
        builder: (_, _) => const UploadPage(),
      ),
      GoRoute(
        path: '/chat',
        builder: (_, _) => const ChatPage(),
      ),
    ],
  );
}