import 'package:flutter_app/features/chat/domain/entity/mesage_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/ask_question_usecase.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final AskQuestionUseCase askQuestionUseCase;

  ChatCubit(this.askQuestionUseCase)
      : super(ChatLoaded([]));

  final List<MessageEntity> _messages = [];

  Future<void> sendMessage(String question) async {
    try {
      _messages.add(
        MessageEntity(
          message: question,
          isUser: true,
        ),
      );

      emit(ChatLoaded(List.from(_messages)));

      final response =
          await askQuestionUseCase(question);

      _messages.add(response);

      emit(ChatLoaded(List.from(_messages)));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
  Future<void> ask(String question) async {
    _messages.add(
      MessageEntity(
        message: question,
        isUser: true,
      ),
    );

    emit(
      ChatLoading(
        // List.from(_messages),
      ),
    );

    try {
      // final answer = await askQuestion(question);

      // _messages.add(answer);

      emit(
        ChatLoaded(
          List.from(_messages),
        ),
      );
    } catch (e) {
      emit(
        ChatError(
         e.toString(),
          // messages: List.from(_messages),
        ),
      );
    }
  }
}