import 'package:flutter_app/features/chat/data/repository/chat_repository_impl.dart';
import 'package:flutter_app/features/upload/data/repository/upload_repository_impl.dart';
import 'package:flutter_app/features/upload/domain/usecases/upload_pdf_use_case.dart';
import 'package:get_it/get_it.dart';
import '../../features/chat/data/datasource/chat_remote_datasource.dart';
import '../../features/chat/domain/repositories/chat_repository.dart';
import '../../features/chat/domain/usecases/ask_question_usecase.dart';
import '../../features/chat/presentation/cubit/chat_cubit.dart';
import '../../features/upload/data/datasource/upload_remote_datasource.dart';
import '../../features/upload/domain/repositories/upload_repository.dart';
import '../../features/upload/presentation/cubit/upload_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {

  /// Data Sources

  sl.registerLazySingleton<ChatRemoteDataSource>(
    () => ChatRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<UploadRemoteDataSource>(
    () => UploadRemoteDataSourceImpl(),
  );

  /// Repositories

  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<UploadRepository>(
    () => UploadRepositoryImpl(sl()),
  );

  /// UseCases

  sl.registerLazySingleton(
    () => AskQuestionUseCase(sl()),
  );

  sl.registerLazySingleton(
    () => UploadPdfUseCase(sl()),
  );

  /// Cubits

  sl.registerFactory(
    () => ChatCubit(sl()),
  );

  sl.registerFactory(
    () => UploadCubit(sl()),
  );
}