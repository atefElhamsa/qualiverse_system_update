import '../../../../core/all_core_imports/all_core_imports.dart';

class AccountVerificationModel {
  final bool isSuccess;
  final ApiErrorModel? error;

  const AccountVerificationModel({required this.isSuccess, this.error});

  factory AccountVerificationModel.fromJson(Map<String, dynamic> json) {
    return AccountVerificationModel(
      isSuccess: json['isSuccess'] ?? false,
      error: json['error'] != null
          ? ApiErrorModel.fromJson(json['error'])
          : null,
    );
  }
}
