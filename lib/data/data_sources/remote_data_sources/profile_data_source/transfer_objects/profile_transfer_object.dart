import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/domain/profile.dart';

part 'profile_transfer_object.freezed.dart';
part 'profile_transfer_object.g.dart';

extension ProfileEntity on ProfileTransferObject {
  Profile toEntity() {
    return Profile(
      id: id,
      email: email,
      photo: photo,
      firstName: firstName,
      lastName: lastName,
      secondName: secondName,
      isAdmin: isAdmin,
    );
  }
}

@freezed
class ProfileTransferObject with _$ProfileTransferObject {
  const factory ProfileTransferObject({
    @Default('') @JsonKey(name: 'user_id') String id,
    @Default('') @JsonKey(name: 'email') String email,
    @Default('') @JsonKey(name: 'photo') String photo,
    @Default('') @JsonKey(name: 'first_name') String firstName,
    @Default('') @JsonKey(name: 'last_name') String lastName,
    @Default('') @JsonKey(name: 'second_name') String secondName,
    @Default(false) @JsonKey(name: 'is_admin') bool isAdmin,
  }) = _ProfileTransferObject;

  factory ProfileTransferObject.fromJson(Map<String, dynamic> json) => _$ProfileTransferObjectFromJson(json);
}
