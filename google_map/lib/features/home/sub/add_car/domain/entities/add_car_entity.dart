
// class AddCarEntity extends Equatable {
//   final int id;
//   final String firstName;
//   final String lastName;

//   const AddCarEntity({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//   });

//   @override
//   List<Object?> get props => [firstName, lastName, id];
// }

class VehicleEntity {
  final String userId;
  final String id;
  final String make;
  final String model;
  final int year;
  final String? color;
  final String? licensePlate;
  final String? vin;
  final int? currentOdometer;
  // final bool? isPrimary;

  VehicleEntity({
    required this.userId,
    required this.id,
    required this.make,
    required this.model,
    required this.year,
     this.color,
     this.licensePlate,
     this.vin,
     this.currentOdometer,
    //  this.isPrimary,
  });
}
