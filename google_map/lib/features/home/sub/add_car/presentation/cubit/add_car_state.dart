
import 'package:google_map/features/home/sub/add_car/domain/entities/add_car_entity.dart';

abstract class VehicleState {}

class VehicleInitial extends VehicleState {}

class VehicleLoading extends VehicleState {}

class VehicleLoaded extends VehicleState {
  final List<VehicleEntity> vehicles;
  VehicleLoaded(this.vehicles);
}

class VehicleError extends VehicleState {
  final String message;
  VehicleError(this.message);
}


// import 'package:equatable/equatable.dart';

// abstract class AddCarState extends Equatable {
//   const AddCarState();

//   @override
//   List<Object?> get props => [];
// }

// class AddCarInitialState extends AddCarState {}
// class AddCarSuccessState extends AddCarState {}

// class AddCarErrorState extends AddCarState {
//   final String message;
//   const AddCarErrorState({required this.message});
//   @override
//   List<Object?> get props => [message];
// }
