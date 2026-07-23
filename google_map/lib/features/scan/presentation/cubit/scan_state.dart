import 'package:equatable/equatable.dart';

abstract class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object?> get props => [];
}

class ScanInitialState extends ScanState {}
class ScanSuccessState extends ScanState {}

class ScanErrorState extends ScanState {
  final String message;
  const ScanErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

