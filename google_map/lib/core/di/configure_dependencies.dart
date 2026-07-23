import 'package:get_it/get_it.dart';
import 'package:google_map/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:google_map/features/scan/di/scan_di.dart';
import 'package:google_map/features/chat_bot/di/chat_bot_di.dart';
import 'package:google_map/features/home/di/home_di.dart';

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true,
  asExtension: true, 
  generateForDir: ['lib'],
)

Future<void> configureDependencies() async {
  
  final getIt = GetIt.instance;
  getIt.allowReassignment = true; 
  // getIt.reset();
  getIt.init();
    // configureMap(getIt);
    configureScan(getIt);
    configureChatBot(getIt);
    configureHome(getIt);
}
