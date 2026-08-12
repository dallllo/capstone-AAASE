import 'package:file_picker/file_picker.dart';
import 'package:flutter_app/features/upload/domain/usecases/upload_pdf_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  final UploadPdfUseCase uploadPdfUseCase;

  UploadCubit(this.uploadPdfUseCase)
      : super(UploadInitial());

  Future<void> uploadPdf(String path) async {
    emit(UploadLoading());

    try {
      await uploadPdfUseCase(path);

      emit(UploadSuccess());
    } catch (e) {
      emit(
        UploadFailure(
          e.toString(),
        ),
      );
    }
  }
  Future<void> pickAndUpload() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result == null) return;

    final path = result.files.single.path;

    if (path == null) return;

    emit(UploadLoading());

    try {
      await uploadPdf(path);

      emit(
        UploadSuccess(
          // result.files.single.name,
        ),
      );
    } catch (e) {
      emit(
        UploadFailure(
          e.toString(),
        ),
      );
    }
  }
}