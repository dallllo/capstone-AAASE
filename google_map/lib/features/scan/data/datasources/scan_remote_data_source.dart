import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_map/core/services/local_keys_service.dart';
import 'package:google_map/features/scan/data/models/scan_model.dart';
import 'package:google_map/core/errors/network_exceptions.dart';


abstract class BaseScanRemoteDataSource {
  Future<ScanModel> getScan();
}


@LazySingleton(as: BaseScanRemoteDataSource)
class ScanRemoteDataSource implements BaseScanRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   ScanRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<ScanModel> getScan() async {
    try {
      return ScanModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
