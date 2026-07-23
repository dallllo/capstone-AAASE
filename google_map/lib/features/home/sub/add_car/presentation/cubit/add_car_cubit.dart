import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map/features/home/sub/add_car/domain/entities/add_car_entity.dart';
import 'package:google_map/features/home/sub/add_car/domain/use_cases/add_car_use_case.dart';
import 'package:google_map/features/home/sub/add_car/presentation/cubit/add_car_state.dart';

// class AddCarCubit extends Cubit<AddCarState> {
//   final AddCarUseCase _addCarUseCase;

//   AddCarCubit(this._addCarUseCase) : super(AddCarInitialState());

//   Future<void> getAddCarMethod() async {
//     final result = await _addCarUseCase.getAddCar();
//     result.when(
//       (success) {
//         //here is when success result
//       },
//       (whenError) {
//        //here is when error result
//       },
//     );
//   }

//   @override
//   Future<void> close() {
//     //here is when close cubit
//     return super.close();
//   }
// }

class VehicleCubit extends Cubit<VehicleState> {
  // final GetVehiclesUseCase getVehiclesUseCase;
final AddCarUseCase _addCarUseCase;

  VehicleCubit(
    // this.getVehiclesUseCase,
    this._addCarUseCase,
  ) : super(VehicleInitial()){
    getVehicles();
  }

  List<VehicleEntity> allVehicles = [];

  Future<void> getVehicles() async {
    emit(VehicleLoading());
final result = await _addCarUseCase.getVehicles();
    result.when(
      (success) {
        allVehicles = success;
        emit(VehicleLoaded(success));
      },
      (whenError) {
      emit(VehicleError(whenError.message));
      },
    );  
  }

  Future<void> addVehicle(VehicleEntity vehicle) async {
    await _addCarUseCase.addVehicle(vehicle);
    getVehicles();
  }

    Future<void> deleteVehicle(String id) async {
    // 1. تنفيذ الحذف في المستودع (Repository)
    await _addCarUseCase.deleteVehicle(id);
    // 2. تحديث القائمة المحلية فوراً لتحسين تجربة المستخدم (UI Update)
    allVehicles.removeWhere((vehicle) => vehicle.id == id);
    // 3. إرسال الحالة الجديدة
    emit(VehicleLoaded(List.from(allVehicles)));
    // ملاحظة: يمكنك إعادة استدعاء getVehicles() بدلاً من الحذف المحلي 
    // لضمان أن البيانات مطابقة تماماً لما في قاعدة البيانات.
  }

  void search(String query) {
    final filtered = allVehicles.where((vehicle) {
      return vehicle.make
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          vehicle.model
              .toLowerCase()
              .contains(query.toLowerCase()) ;
    }).toList();

    emit(VehicleLoaded(filtered));
  }
}