import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:google_map/core/errors/network_exceptions.dart';
import 'package:google_map/core/errors/failure.dart';
import 'package:google_map/features/chat_bot/data/datasources/chat_bot_remote_data_source.dart';
import 'package:google_map/features/chat_bot/domain/repositories/chat_bot_repository_domain.dart';

@LazySingleton(as: ChatBotRepositoryDomain)
class ChatBotRepositoryData implements ChatBotRepositoryDomain{
  final BaseChatBotRemoteDataSource remoteDataSource;


  ChatBotRepositoryData(this.remoteDataSource);

// @override
//   Future<Result<ChatBotEntity, Failure>> getChatBot() async {
//     try {
//       final response = await remoteDataSource.getChatBot();
//       return Success(response.toEntity());
//     } catch (error) {
//       return Error(FailureExceptions.getException(error));
//     }
//   }
  
  // @override
  // Future<Result<String, Failure>> sendMessage(String message) async{
  //   try{
  //     final response = await remoteDataSource.sendMessage(message);
  //     final entity = response.toEntity();
  //   return Success(entity.content);
  //   }
  //   catch (error){
  //     return Error(FailureExceptions.getException(error));
  //   }
  // }
    @override
  Future<Result<String, Failure>> sendMessage(String message) async {
    try {
      final responseString = await remoteDataSource.sendMessage(message);
      return Success(responseString); 
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

}
