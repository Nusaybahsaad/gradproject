import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/presentation/auth_provider.dart';
import '../data/maintenance_repository.dart';
import 'provider_list_screen.dart';

class CreateMaintenanceRequestScreen extends ConsumerStatefulWidget {
  const CreateMaintenanceRequestScreen({super.key});

  @override
  ConsumerState<CreateMaintenanceRequestScreen> createState() =>
      _CreateMaintenanceRequestScreenState();
}

class _CreateMaintenanceRequestScreenState
    extends ConsumerState<CreateMaintenanceRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  String _requestType = 'Personal';
  String? _preferredTimeSlot;
  bool _isSubmitting = false;

  final List<String> _timeSlots = [
    'Morning (8AM - 12PM)',
    'Afternoon (12PM - 5PM)',
    'Evening (5PM - 8PM)',
  ];

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submitRequest() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      final user = ref.read(authProvider).value;
      if (user == null) throw Exception('Not logged in');

      final repository = ref.read(maintenanceRepositoryProvider);
      await repository.createRequest(
        userId: user.id,
        unitId: user.unitId ?? 'unknown',
        type: _requestType,
        description: _descriptionController.text,
        preferredTimeSlot: _preferredTimeSlot,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Request submitted successfully!')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Maintenance Request'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Request Type',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(
                    value: 'Personal',
                    label: Text('Personal'),
                    icon: Icon(Icons.person),
                  ),
                  ButtonSegment(
                    value: 'Community',
                    label: Text('Community'),
                    icon: Icon(Icons.group),
                  ),
                ],
                selected: {_requestType},
                onSelectionChanged: (Set<String> newSelection) {
                  setState(() {
                    _requestType = newSelection.first;
                  });
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Describe the issue in detail...',
                  alignLabelWithHint: true,
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe the issue';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              const Text(
                'Preferred Time Slot',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _timeSlots.map((slot) {
                  return ChoiceChip(
                    label: Text(slot),
                    selected: _preferredTimeSlot == slot,
                    onSelected: (selected) {
                      setState(() {
                        _preferredTimeSlot = selected ? slot : null;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: () {
                  // Mock image picker
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Image picker not implemented in demo'),
                    ),
                  );
                },
                icon: const Icon(Icons.attach_file),
                label: const Text('Attach Photos/Videos'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isSubmitting ? null : _submitRequest,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: _isSubmitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Submit Request', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProviderListScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
                label: const Text('Browse Providers'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
