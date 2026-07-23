import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'chat_bot_di.config.dart'; 

@InjectableInit(
  initializerName: 'initChatBot',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/chat_bot'],
)
void configureChatBot(GetIt getIt) {
  getIt.initChatBot();
}
