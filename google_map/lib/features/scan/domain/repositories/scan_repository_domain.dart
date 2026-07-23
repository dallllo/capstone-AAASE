import 'package:multiple_result/multiple_result.dart';
import 'package:google_map/core/errors/failure.dart';
import 'package:google_map/features/scan/domain/entities/scan_entity.dart';

abstract class ScanRepositoryDomain {
    Future<Result<ScanEntity, Failure>> getScan();
}
