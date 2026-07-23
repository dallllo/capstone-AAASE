import 'package:google_map/features/home/sub/add_car/data/models/add_car_model.dart';
import 'package:google_map/features/home/sub/add_car/domain/entities/add_car_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:google_map/core/errors/failure.dart';

abstract class AddCarRepositoryDomain {
    // Future<Result<AddCarEntity, Failure>> getAddCar();

  Future<Result<void, Failure>>  addVehicle(VehicleEntity vehicle);
  Future<Result<List<VehicleEntity>, Failure>> getVehicles();
  Future<Result<void, Failure>>  deleteVehicle(String id);
  Future<Result<void, Failure>>  setPrimaryVehicle(String id);
}


abstract class VehicleLocalDataSource {
  Future<void> cacheVehicles(List<VehicleModel> vehicles);
  List<VehicleModel> getCachedVehicles();
}