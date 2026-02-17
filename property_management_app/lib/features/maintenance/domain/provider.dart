import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider.freezed.dart';
part 'provider.g.dart';

@freezed
class MaintenanceProvider with _$MaintenanceProvider {
  const factory MaintenanceProvider({
    required String id,
    required String name,
    required String specialty,
    required double rating,
    required int completedJobs,
    required String responseTime,
    required double averagePrice,
    @Default(true) bool isVerified,
  }) = _MaintenanceProvider;

  factory MaintenanceProvider.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceProviderFromJson(json);
}
