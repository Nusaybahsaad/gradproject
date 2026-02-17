import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Mock AI Chatbot Service
/// In production, integrate with OpenAI API, Gemini, or similar
class AIService {
  final Ref ref;

  AIService(this.ref);

  /// Process a user query and generate a response
  Future<String> processQuery({
    required String userId,
    required String query,
    required String language,
  }) async {
    // Simulate AI processing delay
    await Future.delayed(const Duration(seconds: 1));

    // Simple rule-based responses for demo
    final lowerQuery = query.toLowerCase();

    if (lowerQuery.contains('payment') ||
        lowerQuery.contains('pay') ||
        lowerQuery.contains('bill')) {
      return _handlePaymentQuery(userId, language);
    }

    if (lowerQuery.contains('maintenance') || lowerQuery.contains('request')) {
      return _handleMaintenanceQuery(userId, language);
    }

    if (lowerQuery.contains('document') || lowerQuery.contains('file')) {
      return _handleDocumentQuery(userId, language);
    }

    // Default response
    return language == 'ar'
        ? 'مرحباً! أنا هنا للمساعدة. يمكنني الإجابة عن أسئلة المدفوعات والصيانة والوثائق.'
        : 'Hello! I\'m here to help. I can answer questions about payments, maintenance, and documents.';
  }

  String _handlePaymentQuery(String userId, String language) {
    // In production: Query payment repository
    if (language == 'ar') {
      return 'لديك فاتورة معلقة بمبلغ 150 دولار لصيانة المجتمع. الموعد النهائي للدفع هو 15 مارس.';
    }
    return 'You have a pending bill of \$150 for community maintenance. Payment is due on March 15th.';
  }

  String _handleMaintenanceQuery(String userId, String language) {
    // In production: Query maintenance repository
    if (language == 'ar') {
      return 'لديك طلب صيانة واحد قيد التنفيذ. الفني في الطريق ومن المتوقع وصوله في الساعة 2:30 مساءً.';
    }
    return 'You have 1 active maintenance request. The technician is on the way and expected at 2:30 PM.';
  }

  String _handleDocumentQuery(String userId, String language) {
    // In production: Query document repository
    if (language == 'ar') {
      return 'لديك 5 وثائق مخزنة. وثيقة الضمان الخاصة بك ستنتهي خلال 15 يومًا.';
    }
    return 'You have 5 documents stored. Your warranty document expires in 15 days.';
  }
}

final aiServiceProvider = Provider((ref) => AIService(ref));
