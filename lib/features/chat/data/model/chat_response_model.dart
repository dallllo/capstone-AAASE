class ChatResponseModel {
  final String answer;

  ChatResponseModel({
    required this.answer,
  });

  factory ChatResponseModel.fromJson(
      Map<String, dynamic> json) {
    return ChatResponseModel(
      answer: json["answer"],
    );
  }
}