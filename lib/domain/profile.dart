import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String email;
  final String photo;
  final String firstName;
  final String lastName;
  final String secondName;
  final bool isAdmin;

  const Profile({
    required this.email,
    required this.photo,
    required this.firstName,
    required this.lastName,
    required this.secondName,
    required this.isAdmin,
    this.id = '',
  });

  @override
  List<Object?> get props => [
        id,
        email,
        photo,
        firstName,
        lastName,
        secondName,
        isAdmin,
      ];
}
