import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/auth/repository/auth_repository.dart';

final authControllerProvider = Provider(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return AuthController(authRepository: authRepository);
  },
);

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  void signWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signWithPhone(context, phoneNumber);
  }

  void verifyOtp(BuildContext context, String verificationId, String userOtp) {
    authRepository.verifyOtp(
        context: context, verificationId: verificationId, userOtp: userOtp);
  }
}
