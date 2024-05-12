import 'package:mobile_app/data/data_sources/remote_data_sources/profile_data_source/profile_data_source.dart';
import 'package:mobile_app/domain/profile.dart';

class ProfileRepository {
  final ProfileDataSource dataSource;

  ProfileRepository(this.dataSource);

  Profile? _profile;

  bool get hasData => _profile != null;

  Profile get profileSync => _profile!;

  Future<Profile?> get profile async {
    try {
      return _profile ??= await dataSource.getProfile();
    } catch (e) {
      return _profile;
    }
  }

  Future<void> init() async => _profile ??= await dataSource.getProfile();
}
