// import 'package:flutter_app/features/chat/data/datasource/chat_remote_datasource.dart';
// import 'package:flutter_app/features/chat/data/model/chat_request_model.dart';
// import 'package:flutter_app/features/chat/domain/entity/mesage_entity.dart';
// import 'package:flutter_app/features/chat/domain/repositories/chat_repository.dart';

// class ChatRepositoryImpl implements ChatRepository {
//   final ChatRemoteDataSource remote;

//   ChatRepositoryImpl(this.remote);

//   @override
//   Future<MessageEntity> askQuestion(String question) async {
//     final response = await remote.askQuestion(
//       ChatRequestModel(question: question),
//     );

//     return MessageEntity(
//       message: response.answer,
//       isUser: false,
//     );
//   }
// }


import '../../domain/repositories/upload_repository.dart';
import '../datasource/upload_remote_datasource.dart';

class UploadRepositoryImpl implements UploadRepository {
  final UploadRemoteDataSource remote;

  UploadRepositoryImpl(this.remote);

  @override
  Future<void> uploadPdf(String path) {
    try {
      return remote.uploadPdf(path);
    } on Exception catch (e) {
      print(" Error: ❌${e.toString()}}");
      return remote.uploadPdf(path);
    }
  }
}