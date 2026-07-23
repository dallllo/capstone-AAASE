import 'package:multiple_result/multiple_result.dart';
import 'package:google_map/core/errors/failure.dart';

abstract class ChatBotRepositoryDomain {
    // Future<Result<ChatBotEntity, Failure>> getChatBot();
    Future<Result<String, Failure>> sendMessage(String message) ;
}
