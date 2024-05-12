import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/domain/report.dart';

part 'report_transfer_object.freezed.dart';
part 'report_transfer_object.g.dart';

extension ReportEntity on ReportTransferObject {
  Report toEntity() {
    return Report(
      id: id,
      createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
      isEnter: isEnter,
      photo: photo,
      userId: userId,
      latitude: lat,
      longitude: lon,
    );
  }
}

extension ReporTO on Report {
  ReportTransferObject toTransferObject() {
    return ReportTransferObject(
      id: id,
      createdAt: createdAt.toIso8601String(),
      isEnter: isEnter,
      photo: photo,
      userId: userId,
    );
  }
}

@freezed
class ReportTransferObject with _$ReportTransferObject {
  const factory ReportTransferObject({
    @Default(0) int id,
    @Default('') @JsonKey(name: 'created_at') String createdAt,
    @Default(true) @JsonKey(name: 'enter') bool isEnter,
    @Default('') String photo,
    @Default('') @JsonKey(name: 'user_id') String userId,
    @Default(0.0) double lat,
    @Default(0.0) double lon,
  }) = _ReportTO;

  factory ReportTransferObject.fromJson(Map<String, dynamic> json) => _$ReportTransferObjectFromJson(json);
}
