import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;

  const Profile({
    required this.email,
    required this.firstName,
    required this.lastName,
    this.id = '',
  });

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
      ];
}
