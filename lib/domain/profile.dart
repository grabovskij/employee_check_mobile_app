class Profile {
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
}
