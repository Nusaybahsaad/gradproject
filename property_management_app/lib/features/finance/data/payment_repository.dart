import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/payment.dart';
import '../../../core/services/notification_service.dart';
import '../../../core/services/audit_service.dart';
import '../../../core/models/app_notification.dart';

/// Mock Payment Repository
/// In production, connect to a real payment gateway (Stripe, PayPal, etc.)
class PaymentRepository {
  final Ref ref;
  final List<Payment> _payments = [];

  PaymentRepository(this.ref);

  /// Create a new payment
  Future<Payment> createPayment({
    String? requestId,
    String? unitId,
    required String payerId,
    String? providerId,
    required double amount,
    required PaymentType paymentType,
    DateTime? dueDate,
  }) async {
    final payment = Payment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      requestId: requestId,
      unitId: unitId,
      payerId: payerId,
      providerId: providerId,
      amount: amount,
      paymentType: paymentType,
      status: PaymentStatus.pending,
      dueDate: dueDate,
      createdAt: DateTime.now(),
    );

    _payments.add(payment);

    // Audit log
    ref.read(auditServiceProvider).log(
      userId: payerId,
      action: 'payment_created',
      module: 'finance',
      entityId: payment.id,
      metadata: {'amount': amount, 'type': paymentType.name},
    );

    // Send notification
    ref.read(notificationServiceProvider).sendNotification(
          userId: payerId,
          title: 'New Payment Due',
          message: 'You have a new payment of \$${amount.toStringAsFixed(2)}',
          type: NotificationType.payment,
          priority: NotificationPriority.high,
        );

    return payment;
  }

  /// Process a payment
  Future<Payment> processPayment({
    required String paymentId,
    required String paymentMethod,
  }) async {
    final index = _payments.indexWhere((p) => p.id == paymentId);
    if (index == -1) throw Exception('Payment not found');

    // Simulate payment processing
    await Future.delayed(const Duration(seconds: 1));

    final updatedPayment = _payments[index].copyWith(
      status: PaymentStatus.completed,
      transactionReference: 'TXN_${DateTime.now().millisecondsSinceEpoch}',
      paidAt: DateTime.now(),
    );

    _payments[index] = updatedPayment;

    // Audit log
    ref.read(auditServiceProvider).log(
      userId: updatedPayment.payerId,
      action: 'payment_completed',
      module: 'finance',
      entityId: paymentId,
      metadata: {'amount': updatedPayment.amount, 'method': paymentMethod},
    );

    // Notify payer
    ref.read(notificationServiceProvider).sendNotification(
          userId: updatedPayment.payerId,
          title: 'Payment Successful',
          message:
              'Your payment of \$${updatedPayment.amount.toStringAsFixed(2)} was successful',
          type: NotificationType.payment,
          priority: NotificationPriority.normal,
        );

    // Notify provider if applicable
    if (updatedPayment.providerId != null) {
      ref.read(notificationServiceProvider).sendNotification(
            userId: updatedPayment.providerId!,
            title: 'Payment Received',
            message:
                'You received a payment of \$${updatedPayment.amount.toStringAsFixed(2)}',
            type: NotificationType.payment,
            priority: NotificationPriority.normal,
          );
    }

    return updatedPayment;
  }

  /// Get payments for a user
  List<Payment> getPaymentsForUser(String userId) {
    return _payments
        .where((p) => p.payerId == userId || p.providerId == userId)
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  /// Get pending payments for a user
  List<Payment> getPendingPayments(String userId) {
    return _payments
        .where((p) => p.payerId == userId && p.status == PaymentStatus.pending)
        .toList()
      ..sort((a, b) =>
          (a.dueDate ?? a.createdAt).compareTo(b.dueDate ?? b.createdAt));
  }

  /// Get provider earnings
  double getProviderEarnings(String providerId) {
    return _payments
        .where((p) =>
            p.providerId == providerId && p.status == PaymentStatus.completed)
        .fold(0.0, (sum, p) => sum + p.amount);
  }
}

final paymentRepositoryProvider = Provider((ref) => PaymentRepository(ref));
