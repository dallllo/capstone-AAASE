import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map/features/chat_bot/domain/entities/chat_bot_entity.dart';
import 'package:google_map/features/chat_bot/domain/use_cases/chat_bot_use_case.dart';
import 'package:google_map/features/chat_bot/presentation/cubit/chat_bot_state.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  final ChatBotUseCase _chatBotUseCase;

  final TextEditingController controller = TextEditingController();
  ChatBotCubit(this._chatBotUseCase) : super(ChatBotInitialState());


  // ChatCubit(this.useCase) : super([]);
  // Future<void> getChatBotMethod(String text) async {
  //    final updatedMessages = List<ChatBotEntity>.from(state.props)
  //     ..add(ChatBotEntity(role: 'user', content: text));
  //   final result = await _chatBotUseCase.getChatBot();
  //   result.when(
  //     (success) {
  //       emit(ChatBotSuccessState(updatedMessages));
  //     },
  //     (whenError) {
  //      emit(ChatBotErrorState(message: whenError.message));
  //     },
  //   );
  // }

  //   Future<void> sendMessage(String text) async {
  //   final updatedMessages = List<ChatBotEntity>.from(state)
  //     ..add(ChatBotEntity(role: 'user', content: text));

  //   emit(updatedMessages);

  //   final reply = await useCase(text);

  //   emit(List<ChatBotEntity>.from(updatedMessages)
  //     ..add(ChatBotEntity(role: 'bot', content: reply)));
  // }


  Future<void> sendMessage(String text) async {
    // 1. جلب الرسائل القديمة إذا كانت الحالة Success، أو البدء بقائمة فارغة
    List<ChatBotEntity> currentMessages = [];
    if (state is ChatBotSuccessState) {
      currentMessages = List<ChatBotEntity>.from((state as ChatBotSuccessState).data);
    }

    // 2. إضافة رسالة المستخدم وعرضها فوراً
    final updatedWithUser = List<ChatBotEntity>.from(currentMessages)
      ..add(ChatBotEntity(role: 'user', content: text));
    emit(ChatBotSuccessState(updatedWithUser));

    // 3. استدعاء الـ UseCase الصحيح
    final result = await _chatBotUseCase.sendMessage(text);
    
    result.when(
      (replyText) {
        // 4. إضافة رد البوت للقائمة
        final finalMessages = List<ChatBotEntity>.from(updatedWithUser)
          ..add(ChatBotEntity(role: 'bot', content: replyText));
        emit(ChatBotSuccessState(finalMessages));
      },
      (error) {
        emit(ChatBotErrorState(message: error.message));
      },
    );
  }


  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
