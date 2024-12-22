import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypercare/src/core/routers/routers.dart';
import 'package:hypercare/src/features/login/presentation/cubit/login_cubit.dart';

import '../../../../core/core.dart';
import '../../domain/entities/login_entity.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SMColors.white,
      body: SingleChildScrollView(
        key: context.read<LoginCubit>().formKey,
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  const SmSvgPicture.asset(
                    value: SMAssetPaths.loginTop,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(SMDimens.size20),
                      child: Column(
                        children: [
                          const SizedBox(height: SMDimens.size64),
                          const SmSvgPicture.asset(
                              value: SMAssetPaths.logo, fit: BoxFit.cover),
                          const SizedBox(height: SMDimens.size32),
                          Text(SMDisplayStrings.welcomeBack,
                              style: SMFontPoppins.header4Bold),
                          const SizedBox(height: SMDimens.size64),
                          Text(SMDisplayStrings.pleaseLogin,
                              style: SMFontPoppins.actionMedium14
                                  .copyWith(color: SMColors.naturalGrey70)),
                          const SizedBox(height: SMDimens.size32),
                          SMInputField(
                            label: SMDisplayStrings.email,
                            textHint: SMDisplayStrings.emailHint,
                            isRequired: true,
                            controller: context.read<LoginCubit>().email,
                            prefixWidget: const Padding(
                                padding: EdgeInsets.all(8),
                                child: SmSvgPicture.asset(
                                    value: SMAssetPaths.emailIcon)),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !AppRegex.isEmailValid(context.read<LoginCubit>().email.text)) {
                                return SMDisplayStrings.emailError;
                              }
                            },
                          ),
                          const SizedBox(height: SMDimens.size32),
                          SMInputField(
                            label: SMDisplayStrings.password,
                            textHint: SMDisplayStrings.passwordHint,
                            isRequired: true,
                            controller: context.read<LoginCubit>().password,
                            prefixWidget: const Padding(
                                padding: EdgeInsets.all(8),
                                child: SmSvgPicture.asset(
                                    value: SMAssetPaths.passwordIcon)),
                            obscureText: !isShowPassword,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 8) {
                                return SMDisplayStrings.passwordError;
                              }
                            },
                          ),
                          const SizedBox(height: SMDimens.size10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                SMDisplayStrings.forgetPassword,
                                style: SMFontPoppins.actionMedium14
                                    .copyWith(color: SMColors.primary),
                              ),
                            ),
                          ),
                          const SizedBox(height: SMDimens.size10),
                          SizedBox(
                            width: double.infinity,
                            child: SMButtonFill.primaryMedium(
                              text: SMDisplayStrings.login,
                              onPressed: () {
                                if (context.read<LoginCubit>().formKey.currentState!.validate()) {
                                  context.read<LoginCubit>().login(
                                    LoginEntity(
                                      email: context.read<LoginCubit>().email.text,
                                      password: context.read<LoginCubit>().password.text,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: SMDimens.size16),
                          SizedBox(
                            width: double.infinity,
                            child: SMButtonOutline.primaryMedium(
                              text: SMDisplayStrings.dontHaveAccount,
                              onPressed: () {
                                context.pushReplacementNamed(RoutersNames.signUp);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
