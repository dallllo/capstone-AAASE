import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map/features/scan/presentation/pages/scan_feature_screen.dart';
import 'package:google_map/features/scan/presentation/cubit/scan_cubit.dart';
import 'package:google_map/features/chat_bot/presentation/pages/chat_bot_feature_screen.dart';
import 'package:google_map/features/chat_bot/presentation/cubit/chat_bot_cubit.dart';
import 'package:google_map/features/home/presentation/pages/home_feature_screen.dart';
import 'package:google_map/features/home/presentation/cubit/home_cubit.dart';





class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return Scaffold(body: Center(child: Text("splash screen")));
        }, // SplashScreen
      ),
    


  GoRoute(
    path: Routes.scan,
    builder: (context, state) => BlocProvider(
          create: (context) => ScanCubit(GetIt.I.get()),
          child: const ScanFeatureScreen(),
        ),
  ),

  GoRoute(
    path: Routes.chatBot,
    builder: (context, state) => BlocProvider(
          create: (context) => ChatBotCubit(GetIt.I.get()),
          child: ChatBotFeatureScreen(),
        ),
  ),

  GoRoute(
    path: Routes.home,
    builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(GetIt.I.get()),
          child: const HomeFeatureScreen(),
        ),
  ),
],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
