enum UserRole {
  owner,
  tenant,
  supervisor,
  provider,
}

class AppConstants {
  // Maintenance Request Types
  static const String personalRequest = 'Personal';
  static const String communityRequest = 'Community';

  // Request Status
  static const String statusSubmitted = 'Submitted';
  static const String statusAssigned = 'Assigned';
  static const String statusAccepted = 'Accepted';
  static const String statusInProgress = 'In Progress';
  static const String statusCompleted = 'Completed';
  static const String statusRejected = 'Rejected';
}
