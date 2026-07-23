import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map/features/chat_bot/presentation/cubit/chat_bot_cubit.dart';
import 'package:google_map/features/chat_bot/presentation/cubit/chat_bot_state.dart';

class ChatBotFeatureScreen extends StatelessWidget {
  ChatBotFeatureScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatBotCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('ChatBot Feature Screen')),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBotCubit, ChatBotState>(
              builder: (context, state) {
                switch (state) {
                  case ChatBotInitialState _:
                    return Center(child: Text('Start chatting with the bot!'));
                  case ChatBotErrorState _:
                    return Center(child: Text('Error: ${state.message}'));
                  case ChatBotSuccessState _:
                    if (state.data.isEmpty) {
                      return Center(child: Text('No messages yet!'));
                    } else {
                      return ListView.builder(
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          final msg = state.data[index];
                          return Align(
                            alignment: msg.role == 'user'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: msg.role == 'user'
                                    ? Colors.blue
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(msg.content),
                            ),
                          );
                        },
                      );
                    }
                  default:
                    return SizedBox();
                }
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(child: TextField(controller: controller)),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    cubit.sendMessage(controller.text);
                    controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
