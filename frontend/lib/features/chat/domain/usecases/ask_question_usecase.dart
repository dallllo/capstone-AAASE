import 'package:flutter_app/features/chat/domain/entity/mesage_entity.dart';
import '../repositories/chat_repository.dart';

class AskQuestionUseCase {
  final ChatRepository repository;

  AskQuestionUseCase(this.repository);

  Future<MessageEntity> call(String question) {
    return repository.askQuestion(question);
  }
}