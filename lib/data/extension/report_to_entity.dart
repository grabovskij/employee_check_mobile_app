import 'package:mobile_app/data/transfer_objects/report_to.dart';
import 'package:mobile_app/domain/report.dart';

extension ReportEntity on ReportTO {
  Report toEntity() {
    return Report(
      id: id,
      createdAt: DateTime.tryParse(createdAt) ?? DateTime.now(),
      isEnter: isEnter,
      photo: photo,
      userId: userId,
    );
  }
}
