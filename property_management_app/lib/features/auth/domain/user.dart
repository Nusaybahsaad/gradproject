import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    required String phone,
    required String role, // 'owner', 'tenant', 'supervisor', 'provider'
    String? profilePictureUrl,
    @Default(false) bool hideProfilePicture,
    @Default(false) bool restrictToBuildingOnly,
    String? unitId,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
