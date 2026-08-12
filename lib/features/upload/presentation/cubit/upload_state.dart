import 'package:equatable/equatable.dart';

abstract class UploadState extends Equatable {
  const UploadState();

  @override
  List<Object?> get props => [];
}

class UploadInitial extends UploadState {}

class UploadLoading extends UploadState {}

class UploadSuccess extends UploadState {}

class UploadFailure extends UploadState {
  final String message;

  const UploadFailure(this.message);

  @override
  List<Object?> get props => [message];
}