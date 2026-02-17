class Payment {
  final String id;
  final String? requestId;
  final String? unitId;
  final String payerId;
  final String? providerId;
  final double amount;
  final String currency;
  final PaymentType paymentType;
  final PaymentStatus status;
  final String? paymentMethod;
  final String? transactionReference;
  final String? receiptUrl;
  final DateTime? dueDate;
  final DateTime? paidAt;
  final DateTime createdAt;

  const Payment({
    required this.id,
    this.requestId,
    this.unitId,
    required this.payerId,
    this.providerId,
    required this.amount,
    this.currency = 'USD',
    required this.paymentType,
    required this.status,
    this.paymentMethod,
    this.transactionReference,
    this.receiptUrl,
    this.dueDate,
    this.paidAt,
    required this.createdAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      requestId: json['request_id'],
      unitId: json['unit_id'],
      payerId: json['payer_id'],
      providerId: json['provider_id'],
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] ?? 'USD',
      paymentType: PaymentType.values.byName(json['payment_type']),
      status: PaymentStatus.values.byName(json['status']),
      paymentMethod: json['payment_method'],
      transactionReference: json['transaction_reference'],
      receiptUrl: json['receipt_url'],
      dueDate:
          json['due_date'] != null ? DateTime.parse(json['due_date']) : null,
      paidAt: json['paid_at'] != null ? DateTime.parse(json['paid_at']) : null,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'request_id': requestId,
      'unit_id': unitId,
      'payer_id': payerId,
      'provider_id': providerId,
      'amount': amount,
      'currency': currency,
      'payment_type': paymentType.name,
      'status': status.name,
      'payment_method': paymentMethod,
      'transaction_reference': transactionReference,
      'receipt_url': receiptUrl,
      'due_date': dueDate?.toIso8601String(),
      'paid_at': paidAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
    };
  }

  Payment copyWith({
    PaymentStatus? status,
    String? transactionReference,
    String? receiptUrl,
    DateTime? paidAt,
  }) {
    return Payment(
      id: id,
      requestId: requestId,
      unitId: unitId,
      payerId: payerId,
      providerId: providerId,
      amount: amount,
      currency: currency,
      paymentType: paymentType,
      status: status ?? this.status,
      paymentMethod: paymentMethod,
      transactionReference: transactionReference ?? this.transactionReference,
      receiptUrl: receiptUrl ?? this.receiptUrl,
      dueDate: dueDate,
      paidAt: paidAt ?? this.paidAt,
      createdAt: createdAt,
    );
  }
}

enum PaymentType { maintenance, shared_expense, bill }

enum PaymentStatus { pending, completed, failed, refunded }
