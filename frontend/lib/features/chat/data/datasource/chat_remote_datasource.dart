import 'package:dio/dio.dart';
import 'package:flutter_app/features/chat/data/model/chat_request_model.dart';
import 'package:flutter_app/features/chat/data/model/chat_response_model.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/endpoints.dart';


abstract class ChatRemoteDataSource {
  Future<ChatResponseModel> askQuestion(
      ChatRequestModel request);
}

class ChatRemoteDataSourceImpl
    implements ChatRemoteDataSource {
  final Dio dio = ApiClient.dio;

  @override
  Future<ChatResponseModel> askQuestion(
      ChatRequestModel request) async {
        // final res= await dio.get("/get");
        // print("resulit: ✅  ${res.data}");
    final response = await dio.post(
      Endpoints.chat,
      data: request.toJson(),
    );

    return ChatResponseModel.fromJson(response.data);
  }
}