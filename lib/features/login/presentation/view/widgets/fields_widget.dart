import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qualiverse_system/core/all_core_imports/all_core_imports.dart';
import 'package:qualiverse_system/features/all_features_imports/all_features_imports.dart';

import 'package:qualiverse_system/features/login/presentation/view/widgets/update_prompt_helper.dart';

class FieldsWidget extends StatelessWidget {
  const FieldsWidget({
    super.key,
    required this.loginCubit,
    required this.userNameOrEmailController,
    required this.passwordController,
    required this.userNameOrEmailNode,
    required this.passwordNode,
  });

  final LoginCubit loginCubit;
  final TextEditingController userNameOrEmailController;
  final TextEditingController passwordController;
  final FocusNode userNameOrEmailNode;
  final FocusNode passwordNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 388.w,
          child: CustomTextFormField(
            textFieldModel: TextFieldModel(
              customTextLabel: CustomText(
                title: "userNameOrEmail".tr(),
                textStyle: GoogleFonts.inter(
                  fontSize: 13.sp,
                  color: AppColors.aiModelColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () => UpdatePromptHelper.checkUpdateAndPrompt(context),
              onFieldSubmitted: (submit) {
                FocusScope.of(context).requestFocus(passwordNode);
              },
              hintText: "enterUserNameOrEmail".tr(),
              controller: userNameOrEmailController,
              focusNode: userNameOrEmailNode,
              keyboardType: TextInputType.emailAddress,
              validator: (emailOrUserName) =>
                  MyValidators.userNameOrEmailValidator(emailOrUserName),
            ),
          ),
        ),
        const SizedBox(height: 31),
        SizedBox(
          width: 388.w,
          child: CustomTextFormField(
            textFieldModel: TextFieldModel(
              customTextLabel: CustomText(
                title: "password".tr(),
                textStyle: GoogleFonts.inter(
                  fontSize: 13.sp,
                  color: AppColors.aiModelColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              focusNode: passwordNode,
              isObscured: true,
              onFieldSubmitted: (submit) {
                loginCubit.login(
                  userNameOrEmail: userNameOrEmailController.text.trim(),
                  password: passwordController.text.trim(),
                );
              },
              hintText: "enterPassword".tr(),
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              validator: (password) => MyValidators.passwordValidator(password),
            ),
          ),
        ),
      ],
    );
  }
}
