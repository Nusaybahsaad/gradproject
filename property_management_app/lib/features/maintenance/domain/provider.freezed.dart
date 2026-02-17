// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaintenanceProvider _$MaintenanceProviderFromJson(Map<String, dynamic> json) {
  return _MaintenanceProvider.fromJson(json);
}

/// @nodoc
mixin _$MaintenanceProvider {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get specialty => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get completedJobs => throw _privateConstructorUsedError;
  String get responseTime => throw _privateConstructorUsedError;
  double get averagePrice => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;

  /// Serializes this MaintenanceProvider to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaintenanceProvider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaintenanceProviderCopyWith<MaintenanceProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceProviderCopyWith<$Res> {
  factory $MaintenanceProviderCopyWith(
          MaintenanceProvider value, $Res Function(MaintenanceProvider) then) =
      _$MaintenanceProviderCopyWithImpl<$Res, MaintenanceProvider>;
  @useResult
  $Res call(
      {String id,
      String name,
      String specialty,
      double rating,
      int completedJobs,
      String responseTime,
      double averagePrice,
      bool isVerified});
}

/// @nodoc
class _$MaintenanceProviderCopyWithImpl<$Res, $Val extends MaintenanceProvider>
    implements $MaintenanceProviderCopyWith<$Res> {
  _$MaintenanceProviderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaintenanceProvider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? specialty = null,
    Object? rating = null,
    Object? completedJobs = null,
    Object? responseTime = null,
    Object? averagePrice = null,
    Object? isVerified = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      completedJobs: null == completedJobs
          ? _value.completedJobs
          : completedJobs // ignore: cast_nullable_to_non_nullable
              as int,
      responseTime: null == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String,
      averagePrice: null == averagePrice
          ? _value.averagePrice
          : averagePrice // ignore: cast_nullable_to_non_nullable
              as double,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaintenanceProviderImplCopyWith<$Res>
    implements $MaintenanceProviderCopyWith<$Res> {
  factory _$$MaintenanceProviderImplCopyWith(_$MaintenanceProviderImpl value,
          $Res Function(_$MaintenanceProviderImpl) then) =
      __$$MaintenanceProviderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String specialty,
      double rating,
      int completedJobs,
      String responseTime,
      double averagePrice,
      bool isVerified});
}

/// @nodoc
class __$$MaintenanceProviderImplCopyWithImpl<$Res>
    extends _$MaintenanceProviderCopyWithImpl<$Res, _$MaintenanceProviderImpl>
    implements _$$MaintenanceProviderImplCopyWith<$Res> {
  __$$MaintenanceProviderImplCopyWithImpl(_$MaintenanceProviderImpl _value,
      $Res Function(_$MaintenanceProviderImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaintenanceProvider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? specialty = null,
    Object? rating = null,
    Object? completedJobs = null,
    Object? responseTime = null,
    Object? averagePrice = null,
    Object? isVerified = null,
  }) {
    return _then(_$MaintenanceProviderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      completedJobs: null == completedJobs
          ? _value.completedJobs
          : completedJobs // ignore: cast_nullable_to_non_nullable
              as int,
      responseTime: null == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String,
      averagePrice: null == averagePrice
          ? _value.averagePrice
          : averagePrice // ignore: cast_nullable_to_non_nullable
              as double,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaintenanceProviderImpl implements _MaintenanceProvider {
  const _$MaintenanceProviderImpl(
      {required this.id,
      required this.name,
      required this.specialty,
      required this.rating,
      required this.completedJobs,
      required this.responseTime,
      required this.averagePrice,
      this.isVerified = true});

  factory _$MaintenanceProviderImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaintenanceProviderImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String specialty;
  @override
  final double rating;
  @override
  final int completedJobs;
  @override
  final String responseTime;
  @override
  final double averagePrice;
  @override
  @JsonKey()
  final bool isVerified;

  @override
  String toString() {
    return 'MaintenanceProvider(id: $id, name: $name, specialty: $specialty, rating: $rating, completedJobs: $completedJobs, responseTime: $responseTime, averagePrice: $averagePrice, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceProviderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.completedJobs, completedJobs) ||
                other.completedJobs == completedJobs) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            (identical(other.averagePrice, averagePrice) ||
                other.averagePrice == averagePrice) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, specialty, rating,
      completedJobs, responseTime, averagePrice, isVerified);

  /// Create a copy of MaintenanceProvider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceProviderImplCopyWith<_$MaintenanceProviderImpl> get copyWith =>
      __$$MaintenanceProviderImplCopyWithImpl<_$MaintenanceProviderImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaintenanceProviderImplToJson(
      this,
    );
  }
}

abstract class _MaintenanceProvider implements MaintenanceProvider {
  const factory _MaintenanceProvider(
      {required final String id,
      required final String name,
      required final String specialty,
      required final double rating,
      required final int completedJobs,
      required final String responseTime,
      required final double averagePrice,
      final bool isVerified}) = _$MaintenanceProviderImpl;

  factory _MaintenanceProvider.fromJson(Map<String, dynamic> json) =
      _$MaintenanceProviderImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get specialty;
  @override
  double get rating;
  @override
  int get completedJobs;
  @override
  String get responseTime;
  @override
  double get averagePrice;
  @override
  bool get isVerified;

  /// Create a copy of MaintenanceProvider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaintenanceProviderImplCopyWith<_$MaintenanceProviderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
