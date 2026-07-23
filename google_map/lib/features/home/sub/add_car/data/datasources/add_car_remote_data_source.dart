
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_map/core/services/local_keys_service.dart';
import 'package:google_map/features/home/sub/add_car/data/models/add_car_model.dart';

// remote data source 
abstract class BaseAddCarRemoteDataSource {
  Future<void> addVehicle(VehicleModel vehicle);
  Future<List<VehicleModel>> getVehicles();
  Future<void> deleteVehicle(String id);
  Future<void> setPrimaryVehicle(String id);
}


//local data source
abstract class VehicleLocalDataSource {
  Future<void> cacheVehicles(List<VehicleModel> vehicles);
  List<VehicleModel> getCachedVehicles();
}


@LazySingleton(as: VehicleLocalDataSource)
class VehicleLocalDataSourceImpl implements VehicleLocalDataSource {
  final Box box;
  VehicleLocalDataSourceImpl(this.box);
  @override
  Future<void> cacheVehicles(
    List<VehicleModel> vehicles,
  ) async {
    final data = vehicles
        .map((e) => e.toJson())
        .toList();
    await box.put('vehicles', data);
  }

  @override
  List<VehicleModel> getCachedVehicles() {
    final data = box.get('vehicles', defaultValue: []);
    return List<Map<String, dynamic>>.from(data)
        .map((e) => VehicleModel.fromJson(e))
        .toList();
  }
}


@LazySingleton(as: BaseAddCarRemoteDataSource)
class AddCarRemoteDataSource implements BaseAddCarRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

   AddCarRemoteDataSource(this._localKeysService, this._supabase);
    @override
  Future<void> addVehicle(VehicleModel vehicle) async {
   final data = await _supabase
        .from('vehicles')
        .insert(vehicle.toJson());
  }

  @override
  Future<List<VehicleModel>> getVehicles() async {
    // في RemoteDataSource
// final userId = _supabase.auth.currentUser!.id;
// final response = await _supabase
//     .from('vehicles')
//     .select()
//     .eq('user_id', userId); // جلب سيارات المستخدم الحالي فقط

    final response = await _supabase
        .from('vehicles')
        .select()
        .order('created_at');
    return response
        .map<VehicleModel>(
          (e) => VehicleModel.fromJson(e),
        )
        .toList();
  }

  @override
  Future<void> deleteVehicle(String id) async {
   final response = await _supabase
        .from('vehicles')
        .delete()
        .eq('id', id);
  }

  @override
  Future<void> setPrimaryVehicle(String id) async {
    final userId = _supabase.auth.currentUser!.id;

   final data = await _supabase
        .from('vehicles')
        .update({'is_primary': false})
        .eq('user_id', userId);

   final date= await _supabase
        .from('vehicles')
        .update({'is_primary': true})
        .eq('id', id);
  }
}
