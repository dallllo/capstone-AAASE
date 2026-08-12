import 'package:flutter_app/features/chat/domain/entity/mesage_entity.dart';

abstract class ChatRepository {
  Future<MessageEntity> askQuestion(String question);
}