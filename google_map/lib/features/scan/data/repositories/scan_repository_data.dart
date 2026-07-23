
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:google_map/core/errors/network_exceptions.dart';
import 'package:google_map/core/errors/failure.dart';
import 'package:google_map/features/scan/domain/entities/scan_entity.dart';

import 'package:google_map/features/scan/data/datasources/scan_remote_data_source.dart';
import 'package:google_map/features/scan/data/models/scan_model.dart';
import 'package:google_map/features/scan/domain/repositories/scan_repository_domain.dart';

@LazySingleton(as: ScanRepositoryDomain)
class ScanRepositoryData implements ScanRepositoryDomain{
  final BaseScanRemoteDataSource remoteDataSource;


  ScanRepositoryData(this.remoteDataSource);

@override
  Future<Result<ScanEntity, Failure>> getScan() async {
    try {
      final response = await remoteDataSource.getScan();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
