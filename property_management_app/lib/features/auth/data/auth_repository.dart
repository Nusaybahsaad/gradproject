import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/user.dart';

// Mock repository for authentication
class AuthRepository {
  // Mock users database
  final List<User> _users = [
    const User(
      id: '1',
      name: 'John Owner',
      email: 'owner@test.com',
      phone: '+1234567890',
      role: 'owner',
      unitId: 'unit-101',
    ),
    const User(
      id: '2',
      name: 'Jane Tenant',
      email: 'tenant@test.com',
      phone: '+1234567891',
      role: 'tenant',
      unitId: 'unit-102',
    ),
    const User(
      id: '3',
      name: 'Bob Supervisor',
      email: 'supervisor@test.com',
      phone: '+1234567892',
      role: 'supervisor',
    ),
    const User(
      id: '4',
      name: 'Alice Provider',
      email: 'provider@test.com',
      phone: '+1234567893',
      role: 'provider',
    ),
  ];

  Future<User?> login(String email, String password) async {
    // Mock delay
    await Future.delayed(const Duration(seconds: 1));

    // Simple mock authentication (password is always "password123")
    if (password == 'password123') {
      return _users.firstWhere(
        (user) => user.email == email,
        orElse: () => throw Exception('User not found'),
      );
    }
    throw Exception('Invalid credentials');
  }

  Future<User> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String role,
    String? unitId,
  }) async {
    // Mock delay
    await Future.delayed(const Duration(seconds: 1));

    final newUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      phone: phone,
      role: role,
      unitId: unitId,
    );

    _users.add(newUser);
    return newUser;
  }
}

final authRepositoryProvider = Provider((ref) => AuthRepository());
