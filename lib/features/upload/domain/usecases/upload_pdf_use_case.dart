
import 'package:flutter_app/features/upload/domain/repositories/upload_repository.dart';

class UploadPdfUseCase {
  final UploadRepository repository;

  UploadPdfUseCase(this.repository);

  Future<void> call(String path) {
    return repository.uploadPdf(path);
  }
}