import 'package:google_map/core/errors/failure.dart';
import 'package:google_map/features/home/sub/add_car/data/models/add_car_model.dart';
import 'package:injectable/injectable.dart';
import 'package:google_map/features/home/sub/add_car/domain/entities/add_car_entity.dart';
import 'package:google_map/features/home/sub/add_car/domain/repositories/add_car_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class AddCarUseCase {
  final AddCarRepositoryDomain _repositoryData;

  AddCarUseCase(this._repositoryData);
  Future<void> addVehicle(VehicleEntity vehicle) {
    return _repositoryData.addVehicle(vehicle);
  }
    Future<void> deleteVehicle(String id) {
      return _repositoryData.deleteVehicle(id);
    }
Future<List<VehicleEntity>> searchVehicles(
  List<VehicleEntity> vehicles,
  String query,
) async {
  return vehicles.where((vehicle) {
    return vehicle.make
            .toLowerCase()
            .contains(query.toLowerCase()) ||
        vehicle.model
            .toLowerCase()
            .contains(query.toLowerCase());
  }).toList();
}

  Future<Result<List<VehicleEntity>, Failure>>  getVehicles() async {
    try {
      final vehicles = await _repositoryData.getVehicles();
      return vehicles ;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

@lazySingleton
class AddCarUseCase0 {
  //  List<VehicleModel> getCachedVehicles();
  final VehicleLocalDataSource _repositoryData;
  AddCarUseCase0(this._repositoryData);
    Future<List<VehicleModel>> getCachedVehicles() async {
       final vehicles = _repositoryData.getCachedVehicles();
      return vehicles ;
    }
  Future<List<VehicleModel>> getVehicles() async {
    final vehicles = _repositoryData.getCachedVehicles();
    return vehicles;
  }
}

