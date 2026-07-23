import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:google_map/core/errors/failure.dart';
import 'package:google_map/features/chat_bot/domain/repositories/chat_bot_repository_domain.dart';


@lazySingleton
class ChatBotUseCase {
  final ChatBotRepositoryDomain _repositoryData;

  ChatBotUseCase(this._repositoryData);

  //  Future<Result<ChatBotEntity, Failure>> getChatBot() async {
  //   return _repositoryData.getChatBot();
  // }

  Future<Result<String, Failure>> sendMessage(String message) {
    return _repositoryData.sendMessage(message);
  }

}
