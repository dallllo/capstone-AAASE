import 'package:equatable/equatable.dart';
import 'package:google_map/features/chat_bot/domain/entities/chat_bot_entity.dart';

// abstract class ChatBotState extends Equatable {
//   const ChatBotState();

//   @override
//   List<Object?> get props => [];
// }

class ChatBotInitialState extends ChatBotState {}
class ChatBotSuccessState extends ChatBotState {
    final List<ChatBotEntity> data;
  const ChatBotSuccessState(this.data);
    @override
  List<Object?> get props => [data];
}

class ChatBotErrorState extends ChatBotState {
  final String message;
  const ChatBotErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

abstract class ChatBotState extends Equatable {
   const ChatBotState();

  @override
  List<Object?> get props => [];
}



