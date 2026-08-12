class ChatRequestModel {
  final String question;

  ChatRequestModel({
    required this.question,
  });

  Map<String, dynamic> toJson() {
    return {
      "question": question,
    };
  }
}
