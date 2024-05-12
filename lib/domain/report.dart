import 'package:equatable/equatable.dart';

class Report extends Equatable {
  final int id;
  final DateTime createdAt;
  final bool isEnter;
  final String photo;
  final String userId;
  final double latitude;
  final double longitude;

  const Report({
    required this.id,
    required this.createdAt,
    required this.isEnter,
    required this.photo,
    required this.userId,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        isEnter,
        photo,
        userId,
        latitude,
        longitude,
      ];
}
