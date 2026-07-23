
import 'package:google_map/features/home/sub/add_car/domain/entities/add_car_entity.dart';

class VehicleModel extends VehicleEntity {
  VehicleModel({
    required super.id,
    required super.userId,
    required super.make,
    required super.model,
    required super.year,
     super.color,
     super.licensePlate,
     super.vin,
     super.currentOdometer,
    //  super.isPrimary,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      userId: json['user_id'],
      id: json['id'],
      make: json['make'],
      model: json['model'],
      year: json['year'],
      color: json['color'] ?? '',
      licensePlate: json['license_plate'] ?? '',
      vin: json['vin'] ?? '',
      currentOdometer: json['current_odometer'] ?? 0,
      // isPrimary: json['is_primary'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'id': id,
      'make': make,
      'model': model,
      'year': year,
      'color': color,
      'license_plate': licensePlate,
      'vin': vin,
      'current_odometer': currentOdometer,
      // 'is_primary': isPrimary,
    };
  }
}








// import 'package:google_map/features/home/sub/add_car/domain/entities/add_car_entity.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'add_car_model.freezed.dart';
// part 'add_car_model.g.dart';

// @freezed
// abstract class AddCarModel with _$AddCarModel {
//   const factory AddCarModel({
//     required int id,
//     required String firstName,
//     required String lastName,
    
//   }) = _AddCarModel;

//   factory AddCarModel.fromJson(Map<String, Object?> json) => _$AddCarModelFromJson(json);
// }



// extension AddCarModelMapper on AddCarModel {
//   AddCarEntity toEntity() {
//     return AddCarEntity(id: id, firstName: firstName, lastName: lastName);
//   }
//   }
