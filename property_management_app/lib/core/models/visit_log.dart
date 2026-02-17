class VisitLog {
  final String id;
  final String requestId;
  final String providerId;
  final VisitStatus status;
  final DateTime? proposedTime;
  final DateTime? confirmedTime;
  final DateTime? arrivalTime;
  final DateTime? startTime;
  final DateTime? completionTime;
  final String? technicianName;
  final String? notes;
  final bool residentConfirmed;
  final DateTime createdAt;
  final DateTime updatedAt;

  const VisitLog({
    required this.id,
    required this.requestId,
    required this.providerId,
    required this.status,
    this.proposedTime,
    this.confirmedTime,
    this.arrivalTime,
    this.startTime,
    this.completionTime,
    this.technicianName,
    this.notes,
    this.residentConfirmed = false,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VisitLog.fromJson(Map<String, dynamic> json) {
    return VisitLog(
      id: json['id'],
      requestId: json['request_id'],
      providerId: json['provider_id'],
      status: VisitStatus.values.byName(json['status']),
      proposedTime: json['proposed_time'] != null
          ? DateTime.parse(json['proposed_time'])
          : null,
      confirmedTime: json['confirmed_time'] != null
          ? DateTime.parse(json['confirmed_time'])
          : null,
      arrivalTime: json['arrival_time'] != null
          ? DateTime.parse(json['arrival_time'])
          : null,
      startTime: json['start_time'] != null
          ? DateTime.parse(json['start_time'])
          : null,
      completionTime: json['completion_time'] != null
          ? DateTime.parse(json['completion_time'])
          : null,
      technicianName: json['technician_name'],
      notes: json['notes'],
      residentConfirmed: json['resident_confirmed'] ?? false,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'request_id': requestId,
      'provider_id': providerId,
      'status': status.name,
      'proposed_time': proposedTime?.toIso8601String(),
      'confirmed_time': confirmedTime?.toIso8601String(),
      'arrival_time': arrivalTime?.toIso8601String(),
      'start_time': startTime?.toIso8601String(),
      'completion_time': completionTime?.toIso8601String(),
      'technician_name': technicianName,
      'notes': notes,
      'resident_confirmed': residentConfirmed,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  VisitLog copyWith({
    VisitStatus? status,
    DateTime? confirmedTime,
    DateTime? arrivalTime,
    DateTime? startTime,
    DateTime? completionTime,
    String? notes,
    bool? residentConfirmed,
  }) {
    return VisitLog(
      id: id,
      requestId: requestId,
      providerId: providerId,
      status: status ?? this.status,
      proposedTime: proposedTime,
      confirmedTime: confirmedTime ?? this.confirmedTime,
      arrivalTime: arrivalTime ?? this.arrivalTime,
      startTime: startTime ?? this.startTime,
      completionTime: completionTime ?? this.completionTime,
      technicianName: technicianName,
      notes: notes ?? this.notes,
      residentConfirmed: residentConfirmed ?? this.residentConfirmed,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }
}

enum VisitStatus {
  scheduled,
  on_the_way,
  arrived,
  work_started,
  completed,
  cancelled
}
