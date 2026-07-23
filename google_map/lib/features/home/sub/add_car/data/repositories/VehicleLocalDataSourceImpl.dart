
import 'package:google_map/features/home/sub/add_car/data/datasources/add_car_remote_data_source.dart';
import 'package:google_map/features/home/sub/add_car/data/models/add_car_model.dart';
import 'package:hive/hive.dart';

// @LazySingleton(as: VehicleLocalDataSource)
class VehicleLocalDataSourceImpl implements VehicleLocalDataSource {
  final Box box;

  VehicleLocalDataSourceImpl(this.box);

  // @override
  // Future<void> cacheVehicles(
  //   List<VehicleModel> vehicles,
  // ) async {
  //   final data = vehicles
  //       .map((e) => e.toJson())
  //       .toList();

  //   await box.put('vehicles', data);
  // }

  // @override
  // List<VehicleModel> getCachedVehicles() {
  //   final data = box.get('vehicles', defaultValue: []);

  //   return List<Map<String, dynamic>>.from(data)
  //       .map((e) => VehicleModel.fromJson(e))
  //       .toList();
  // }



  @override
  Future<void> cacheVehicles(List<VehicleModel> vehicles) async {
    final data = vehicles.map((e) => e.toJson()).toList();
    await box.put('vehicles', data);
  }

  @override
  List<VehicleModel> getCachedVehicles() {
    final data = box.get('vehicles', defaultValue: []);
    
    // تحويل آمن للبيانات القادمة من Hive
    return (data as List).map((e) {
      return VehicleModel.fromJson(Map<String, dynamic>.from(e));
    }).toList();
  }


}