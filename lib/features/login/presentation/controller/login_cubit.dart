import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qualiverse_system/routing/all_routes_imports.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  bool rememberMe = false;

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  void toggleRememberMe({required bool value}) {
    rememberMe = value;
    if (!value) {
      LoginStorage.clear();
    }
    emit(LoginInitial());
  }

  Future<bool> checkInternet() async {
    final conn = await Connectivity().checkConnectivity();
    return !conn.contains(ConnectivityResult.none);
  }

  Future<void> login({
    required String userNameOrEmail,
    required String password,
  }) async {
    if (userNameOrEmail.isEmpty || password.isEmpty) {
      emit(LoginFailure(errorMessage: "fillAllFields".tr()));
      return;
    }

    if (!await checkInternet()) {
      emit(LoginFailure(errorMessage: "checkInternet".tr()));
      return;
    }

    try {
      emit(LoginLoading());
      final result = await loginUseCase(
        userNameOrEmail: userNameOrEmail,
        password: password,
      );

      LoginStorage.setSession(
        tokenValue: result.token,
        refreshTokenValue: result.refreshToken,
        refreshTokenExpirationValue: result.refreshTokenExpiration,
      );

      if (rememberMe) {
        await LoginStorage.savePersistent();
      }

      await CashHelper.saveData(key: KeysTexts.userPassword, value: password);

      emit(LoginSuccess(user: result));
    } catch (e) {
      emit(
        LoginFailure(
          errorMessage: e.toString().replaceFirst("Exception: ", "").trim(),
        ),
      );
    }
  }
}
