import 'package:flutter/material.dart';
import 'package:flutter_app/app.dart';
import 'package:flutter_app/core/dependency_injection/injection.dart';

Future<void> main() async {
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}
