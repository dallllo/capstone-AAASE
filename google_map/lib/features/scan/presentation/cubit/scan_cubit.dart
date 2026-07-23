import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map/features/scan/domain/use_cases/scan_use_case.dart';
import 'package:google_map/features/scan/presentation/cubit/scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  final ScanUseCase _scanUseCase;

  ScanCubit(this._scanUseCase) : super(ScanInitialState());

  Future<void> getScanMethod() async {
    final result = await _scanUseCase.getScan();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
