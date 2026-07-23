import 'package:google_map/features/scan/domain/entities/scan_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'scan_model.freezed.dart';
part 'scan_model.g.dart';

@freezed
abstract class ScanModel with _$ScanModel {
  const factory ScanModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _ScanModel;

  factory ScanModel.fromJson(Map<String, Object?> json) => _$ScanModelFromJson(json);
}



extension ScanModelMapper on ScanModel {
  ScanEntity toEntity() {
    return ScanEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
