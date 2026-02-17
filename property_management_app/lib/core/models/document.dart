class Document {
  final String id;
  final String? unitId;
  final String? buildingId;
  final String uploadedBy;
  final String title;
  final DocumentCategory category;
  final String fileUrl;
  final String? fileType;
  final DateTime? expiryDate;
  final int version;
  final DocumentVisibility visibility;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Document({
    required this.id,
    this.unitId,
    this.buildingId,
    required this.uploadedBy,
    required this.title,
    required this.category,
    required this.fileUrl,
    this.fileType,
    this.expiryDate,
    this.version = 1,
    this.visibility = DocumentVisibility.owner,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'],
      unitId: json['unit_id'],
      buildingId: json['building_id'],
      uploadedBy: json['uploaded_by'],
      title: json['title'],
      category: DocumentCategory.values.byName(json['category']),
      fileUrl: json['file_url'],
      fileType: json['file_type'],
      expiryDate: json['expiry_date'] != null
          ? DateTime.parse(json['expiry_date'])
          : null,
      version: json['version'] ?? 1,
      visibility:
          DocumentVisibility.values.byName(json['visibility'] ?? 'owner'),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'unit_id': unitId,
      'building_id': buildingId,
      'uploaded_by': uploadedBy,
      'title': title,
      'category': category.name,
      'file_url': fileUrl,
      'file_type': fileType,
      'expiry_date': expiryDate?.toIso8601String(),
      'version': version,
      'visibility': visibility.name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  bool isExpiringSoon() {
    if (expiryDate == null) return false;
    final daysUntilExpiry = expiryDate!.difference(DateTime.now()).inDays;
    return daysUntilExpiry <= 30 && daysUntilExpiry >= 0;
  }

  bool isExpired() {
    if (expiryDate == null) return false;
    return expiryDate!.isBefore(DateTime.now());
  }
}

enum DocumentCategory { contract, invoice, warranty, certificate, other }

enum DocumentVisibility { owner, supervisor, all }
