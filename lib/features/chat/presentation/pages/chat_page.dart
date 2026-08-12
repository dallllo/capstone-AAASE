import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/chat_cubit.dart';
import '../cubit/chat_state.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Agentic RAG"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
        
            Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
        
                  if (state is ChatInitial) {
                    return const Center(
                      child: Text("Ask anything"),
                    );
                  }
        
                  if (state is ChatLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
        
                  if (state is ChatError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
        
                  // if (state is ChatLoaded) {
                  //   return Padding(
                  //     padding: const EdgeInsets.all(16),
                  //     child: SingleChildScrollView(
                  //       child: Text(
                  //         state.messages.first.message,
                  //         style: const TextStyle(fontSize: 16),
                  //       ),
                  //     ),
                  //   );
                  // }
        
                  if (state is ChatLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.messages.length,
            itemBuilder: (_, index) {
        final message = state.messages[index];
        
        return Align(
          alignment: message.isUser
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: message.isUser
                  ? Colors.blue
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message.message,
              style: TextStyle(
                color: message.isUser
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        );
            },
          );
        }
        
                  return const SizedBox();
                },
              ),
            ),
        
            const Divider(),
        
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
        
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: "Ask a question...",
                      ),
                    ),
                  ),
        
                  const SizedBox(width: 10),
        
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
        
                      final question = controller.text.trim();
        
                      if(question.isEmpty) return;
                      context.read<ChatCubit>().sendMessage(question);
                      // context.read<ChatCubit>().ask(question);
        
                      controller.clear();
                    },
                  )
        
                ],
              ),
            )
        
          ],
        ),
      ),
    );
  }
}