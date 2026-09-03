import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String email;
  final String role;
  final String token;
  final String refreshToken;
  final DateTime refreshTokenExpiration;
  final bool isActive;

  const UserEntity({
    required this.userId,
    required this.email,
    required this.role,
    required this.token,
    required this.refreshToken,
    required this.refreshTokenExpiration,
    this.isActive = true,
  });

  @override
  List<Object?> get props => [
        userId,
        email,
        role,
        token,
        refreshToken,
        refreshTokenExpiration,
        isActive,
      ];
}
