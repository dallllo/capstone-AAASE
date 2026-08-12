import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/endpoints.dart';

abstract class UploadRemoteDataSource {
  Future<void> uploadPdf(String path);
}

class UploadRemoteDataSourceImpl
    implements UploadRemoteDataSource {
  final Dio dio = ApiClient.dio;

  @override
  Future<void> uploadPdf(String path) async {
    final formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(path),
    });

    await dio.post(
      Endpoints.upload,
      data: formData,
    );
  }
}