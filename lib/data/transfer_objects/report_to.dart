import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_to.freezed.dart';
part 'report_to.g.dart';

@freezed
class ReportTO with _$ReportTO {
  const factory ReportTO({
    @Default(0) int id,
    @Default('') @JsonKey(name: 'created_at') String createdAt,
    @Default(true) bool isEnter,
    @Default('') String photo,
    @Default('') @JsonKey(name: 'user_id') String userId,
  }) = _ReportTO;

  factory ReportTO.fromJson(Map<String, dynamic> json) =>
      _$ReportTOFromJson(json);
}
