class Transaction {
  final String id;
  final String paymentId;
  final String? description;
  final double amount;
  final TransactionType type;
  final DateTime createdAt;

  const Transaction({
    required this.id,
    required this.paymentId,
    this.description,
    required this.amount,
    required this.type,
    required this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      paymentId: json['payment_id'],
      description: json['description'],
      amount: (json['amount'] as num).toDouble(),
      type: TransactionType.values.byName(json['type']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'payment_id': paymentId,
      'description': description,
      'amount': amount,
      'type': type.name,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

enum TransactionType { debit, credit }
