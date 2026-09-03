import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qualiverse_system/features/login/presentation/view/widgets/update_prompt_helper.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../data/repositories/login_repository_impl.dart';
import '../../data/data_sources/login_remote_data_source.dart';
import 'package:qualiverse_system/routing/all_routes_imports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UpdatePromptHelper.checkUpdateAndPrompt(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final dio = ApiClient.dio;
        final remoteDataSource = LoginRemoteDataSourceImpl(dio: dio);
        final repository = LoginRepositoryImpl(
          remoteDataSource: remoteDataSource,
        );
        final useCase = LoginUseCase(repository);
        return LoginCubit(loginUseCase: useCase);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor == AppColors.white
            ? AppColors.loginBackground2
            : AppColors.mainBlack,
        body: const LoginBody(),
      ),
    );
  }
}
