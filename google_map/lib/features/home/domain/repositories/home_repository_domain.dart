import 'package:multiple_result/multiple_result.dart';
import 'package:google_map/core/errors/failure.dart';
import 'package:google_map/features/home/domain/entities/home_entity.dart';

abstract class HomeRepositoryDomain {
    Future<Result<HomeEntity, Failure>> getHome();
}
