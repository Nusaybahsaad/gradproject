// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaintenanceRequest _$MaintenanceRequestFromJson(Map<String, dynamic> json) {
  return _MaintenanceRequest.fromJson(json);
}

/// @nodoc
mixin _$MaintenanceRequest {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get unitId => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // 'Personal' or 'Community'
  String get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<String> get attachments => throw _privateConstructorUsedError;
  String? get preferredTimeSlot => throw _privateConstructorUsedError;
  String? get assignedProviderId => throw _privateConstructorUsedError;
  DateTime? get acceptedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this MaintenanceRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaintenanceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaintenanceRequestCopyWith<MaintenanceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceRequestCopyWith<$Res> {
  factory $MaintenanceRequestCopyWith(
          MaintenanceRequest value, $Res Function(MaintenanceRequest) then) =
      _$MaintenanceRequestCopyWithImpl<$Res, MaintenanceRequest>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String unitId,
      String type,
      String description,
      String status,
      DateTime createdAt,
      List<String> attachments,
      String? preferredTimeSlot,
      String? assignedProviderId,
      DateTime? acceptedAt,
      DateTime? completedAt});
}

/// @nodoc
class _$MaintenanceRequestCopyWithImpl<$Res, $Val extends MaintenanceRequest>
    implements $MaintenanceRequestCopyWith<$Res> {
  _$MaintenanceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaintenanceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? unitId = null,
    Object? type = null,
    Object? description = null,
    Object? status = null,
    Object? createdAt = null,
    Object? attachments = null,
    Object? preferredTimeSlot = freezed,
    Object? assignedProviderId = freezed,
    Object? acceptedAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferredTimeSlot: freezed == preferredTimeSlot
          ? _value.preferredTimeSlot
          : preferredTimeSlot // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedProviderId: freezed == assignedProviderId
          ? _value.assignedProviderId
          : assignedProviderId // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaintenanceRequestImplCopyWith<$Res>
    implements $MaintenanceRequestCopyWith<$Res> {
  factory _$$MaintenanceRequestImplCopyWith(_$MaintenanceRequestImpl value,
          $Res Function(_$MaintenanceRequestImpl) then) =
      __$$MaintenanceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String unitId,
      String type,
      String description,
      String status,
      DateTime createdAt,
      List<String> attachments,
      String? preferredTimeSlot,
      String? assignedProviderId,
      DateTime? acceptedAt,
      DateTime? completedAt});
}

/// @nodoc
class __$$MaintenanceRequestImplCopyWithImpl<$Res>
    extends _$MaintenanceRequestCopyWithImpl<$Res, _$MaintenanceRequestImpl>
    implements _$$MaintenanceRequestImplCopyWith<$Res> {
  __$$MaintenanceRequestImplCopyWithImpl(_$MaintenanceRequestImpl _value,
      $Res Function(_$MaintenanceRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaintenanceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? unitId = null,
    Object? type = null,
    Object? description = null,
    Object? status = null,
    Object? createdAt = null,
    Object? attachments = null,
    Object? preferredTimeSlot = freezed,
    Object? assignedProviderId = freezed,
    Object? acceptedAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_$MaintenanceRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferredTimeSlot: freezed == preferredTimeSlot
          ? _value.preferredTimeSlot
          : preferredTimeSlot // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedProviderId: freezed == assignedProviderId
          ? _value.assignedProviderId
          : assignedProviderId // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptedAt: freezed == acceptedAt
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaintenanceRequestImpl implements _MaintenanceRequest {
  const _$MaintenanceRequestImpl(
      {required this.id,
      required this.userId,
      required this.unitId,
      required this.type,
      required this.description,
      required this.status,
      required this.createdAt,
      final List<String> attachments = const [],
      this.preferredTimeSlot,
      this.assignedProviderId,
      this.acceptedAt,
      this.completedAt})
      : _attachments = attachments;

  factory _$MaintenanceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaintenanceRequestImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String unitId;
  @override
  final String type;
// 'Personal' or 'Community'
  @override
  final String description;
  @override
  final String status;
  @override
  final DateTime createdAt;
  final List<String> _attachments;
  @override
  @JsonKey()
  List<String> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  final String? preferredTimeSlot;
  @override
  final String? assignedProviderId;
  @override
  final DateTime? acceptedAt;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'MaintenanceRequest(id: $id, userId: $userId, unitId: $unitId, type: $type, description: $description, status: $status, createdAt: $createdAt, attachments: $attachments, preferredTimeSlot: $preferredTimeSlot, assignedProviderId: $assignedProviderId, acceptedAt: $acceptedAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.preferredTimeSlot, preferredTimeSlot) ||
                other.preferredTimeSlot == preferredTimeSlot) &&
            (identical(other.assignedProviderId, assignedProviderId) ||
                other.assignedProviderId == assignedProviderId) &&
            (identical(other.acceptedAt, acceptedAt) ||
                other.acceptedAt == acceptedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      unitId,
      type,
      description,
      status,
      createdAt,
      const DeepCollectionEquality().hash(_attachments),
      preferredTimeSlot,
      assignedProviderId,
      acceptedAt,
      completedAt);

  /// Create a copy of MaintenanceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceRequestImplCopyWith<_$MaintenanceRequestImpl> get copyWith =>
      __$$MaintenanceRequestImplCopyWithImpl<_$MaintenanceRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaintenanceRequestImplToJson(
      this,
    );
  }
}

abstract class _MaintenanceRequest implements MaintenanceRequest {
  const factory _MaintenanceRequest(
      {required final String id,
      required final String userId,
      required final String unitId,
      required final String type,
      required final String description,
      required final String status,
      required final DateTime createdAt,
      final List<String> attachments,
      final String? preferredTimeSlot,
      final String? assignedProviderId,
      final DateTime? acceptedAt,
      final DateTime? completedAt}) = _$MaintenanceRequestImpl;

  factory _MaintenanceRequest.fromJson(Map<String, dynamic> json) =
      _$MaintenanceRequestImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get unitId;
  @override
  String get type; // 'Personal' or 'Community'
  @override
  String get description;
  @override
  String get status;
  @override
  DateTime get createdAt;
  @override
  List<String> get attachments;
  @override
  String? get preferredTimeSlot;
  @override
  String? get assignedProviderId;
  @override
  DateTime? get acceptedAt;
  @override
  DateTime? get completedAt;

  /// Create a copy of MaintenanceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaintenanceRequestImplCopyWith<_$MaintenanceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
