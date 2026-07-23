import 'package:google_map/features/home/sub/add_car/data/datasources/add_car_remote_data_source.dart';
import 'package:google_map/features/home/sub/add_car/domain/entities/add_car_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:google_map/core/errors/network_exceptions.dart';
import 'package:google_map/core/errors/failure.dart';
import 'package:google_map/features/home/sub/add_car/data/models/add_car_model.dart';
import 'package:google_map/features/home/sub/add_car/domain/repositories/add_car_repository_domain.dart';

@LazySingleton(as: AddCarRepositoryDomain)
class AddCarRepositoryData implements AddCarRepositoryDomain{
  final BaseAddCarRemoteDataSource remoteDataSource;
  // final VehicleLocalDataSource localDataSource;
  AddCarRepositoryData(this.remoteDataSource,);
  @override
  Future<Result<void, Failure>> addVehicle(VehicleEntity vehicle ) async {
    try{
      final model = VehicleModel(
        userId: vehicle.userId,
      id: vehicle.id,
      make: vehicle.make,
      model: vehicle.model,
      year: vehicle.year,
      color: vehicle.color,
      licensePlate: vehicle.licensePlate,
      vin: vehicle.vin,
      currentOdometer: vehicle.currentOdometer,
      // isPrimary: vehicle.isPrimary,
    );

     final carInfo =  await remoteDataSource.addVehicle(model);
       return Success(carInfo);
    }
    catch(error){
      return Error(FailureExceptions.getException(error));
    }
  }
  
  @override
  Future<Result<void, Failure>> deleteVehicle(String id) async {
    try{
     final carInfo =  await remoteDataSource.deleteVehicle(id);
       return Success(carInfo);
    }
    catch(error){
      return Error(FailureExceptions.getException(error));
    }
  }
  
  @override
  Future<Result<List<VehicleModel>, Failure>> getVehicles() async {
    try{
     final carInfo =  await remoteDataSource.getVehicles();
    //  await localDataSource.cacheVehicles(carInfo);
       return Success(carInfo);
    }
    catch(error){

      // return localDataSource.getCachedVehicles();
      return Error(FailureExceptions.getException(error));
    }
  }
  
  @override
  Future<Result<void, Failure>> setPrimaryVehicle(String id) async {
    try{
     final carInfo =  await remoteDataSource.setPrimaryVehicle(id);
       return Success(carInfo);
    }
    catch(error){
      return Error(FailureExceptions.getException(error));
    }
  }
}

