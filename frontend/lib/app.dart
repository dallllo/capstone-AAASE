
import 'package:flutter/material.dart';
import 'package:flutter_app/core/app_routter/app_routter.dart';
import 'package:flutter_app/core/dependency_injection/injection.dart';
import 'package:flutter_app/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:flutter_app/features/upload/presentation/cubit/upload_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // create: (_) => getIt<ChatCubit>(),
          create: (_) => sl<ChatCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<UploadCubit>()
          // getIt<UploadCubit>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Agentic RAG',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.white,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}