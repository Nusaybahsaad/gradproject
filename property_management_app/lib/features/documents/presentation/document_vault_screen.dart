import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/document.dart';
import '../data/document_repository.dart';
import '../../../core/theme/app_theme.dart';
import 'package:intl/intl.dart';

class DocumentVaultScreen extends ConsumerWidget {
  final String userId;
  final String userRole; // 'owner', 'tenant', 'supervisor'

  const DocumentVaultScreen({
    super.key,
    required this.userId,
    required this.userRole,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final docRepo = ref.read(documentRepositoryProvider);
    // In a real app, unitId would be fetched from user profile
    final docs = docRepo.getDocuments(
        userId: userId, userRole: userRole, unitId: 'unit_123');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Passport'),
        backgroundColor: AppTheme.primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showUploadDialog(context, ref),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCategoryFilter(),
          Expanded(
            child: docs.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.folder_open, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text('No documents found'),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return _DocumentTile(document: docs[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: const [
          _FilterChip(label: 'All', isSelected: true),
          _FilterChip(label: 'Contracts'),
          _FilterChip(label: 'Invoices'),
          _FilterChip(label: 'Warranties'),
        ],
      ),
    );
  }

  void _showUploadDialog(BuildContext context, WidgetRef ref) {
    // Implementation of upload dialog
    // ...
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _FilterChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
        backgroundColor:
            isSelected ? AppTheme.primaryColor : Colors.grey.shade200,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

class _DocumentTile extends StatelessWidget {
  final Document document;

  const _DocumentTile({required this.document});

  @override
  Widget build(BuildContext context) {
    final isExpiring = document.isExpiringSoon();
    final isExpired = document.isExpired();

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getIconForCategory(document.category),
            color: AppTheme.primaryColor,
          ),
        ),
        title: Text(
          document.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
                'Uploaded ${DateFormat('MMM dd, yyyy').format(document.createdAt)}'),
            if (document.expiryDate != null) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 14,
                    color: isExpired
                        ? Colors.red
                        : isExpiring
                            ? Colors.orange
                            : Colors.green,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Expires: ${DateFormat('MMM dd, yyyy').format(document.expiryDate!)}',
                    style: TextStyle(
                      color: isExpired
                          ? Colors.red
                          : isExpiring
                              ? Colors.orange
                              : Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'view', child: Text('View')),
            const PopupMenuItem(value: 'download', child: Text('Download')),
            const PopupMenuItem(value: 'share', child: Text('Share')),
          ],
        ),
      ),
    );
  }

  IconData _getIconForCategory(DocumentCategory category) {
    switch (category) {
      case DocumentCategory.contract:
        return Icons.gavel;
      case DocumentCategory.invoice:
        return Icons.receipt;
      case DocumentCategory.warranty:
        return Icons.security;
      case DocumentCategory.certificate:
        return Icons.verified;
      default:
        return Icons.description;
    }
  }
}
