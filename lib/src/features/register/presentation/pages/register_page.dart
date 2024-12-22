import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/consent/consent.dart';
import '../../../../core/core.dart';
import '../../domain/entities/register_entity.dart';
import '../cubit/register_cubit.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: context.read<RegisterCubit>().formKey,
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
                          const SizedBox(height: SMDimens.size24),
                          Text(SMDisplayStrings.joinUs,
                              style: SMFontPoppins.header4Bold),
                          const SizedBox(height: SMDimens.size24),
                          Text(SMDisplayStrings.pleaseRegister,
                              style: SMFontPoppins.actionMedium14
                                  .copyWith(color: SMColors.naturalGrey70)),
                          const SizedBox(height: SMDimens.size24),
                          SMInputField(
                            label: SMDisplayStrings.name,
                            textHint: SMDisplayStrings.nameHint,
                            isRequired: true,
                            controller: context.read<RegisterCubit>().nameController,
                            prefixWidget: const Padding(
                                padding: EdgeInsets.all(8),
                                child: SmSvgPicture.asset(
                                    value: SMAssetPaths.userIcon)),
                          ),
                          const SizedBox(height: SMDimens.size10),
                          SMInputField(
                            label: SMDisplayStrings.email,
                            textHint: SMDisplayStrings.emailHint,
                            isRequired: true,
                            controller: context.read<RegisterCubit>().emailController,
                            prefixWidget: const Padding(
                                padding: EdgeInsets.all(8),
                                child: SmSvgPicture.asset(
                                    value: SMAssetPaths.emailIcon)),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !AppRegex.isEmailValid(context.read<RegisterCubit>().emailController.text)) {
                                return SMDisplayStrings.emailError;
                              }
                            },
                          ),
                          const SizedBox(height: SMDimens.size10),
                          SMInputField(
                            label: SMDisplayStrings.password,
                            textHint: SMDisplayStrings.passwordHint,
                            isRequired: true,
                            controller: context.read<RegisterCubit>().passwordController,
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
                          SMInputField(
                            label: SMDisplayStrings.age,
                            textHint: SMDisplayStrings.ageHint,
                            isRequired: true,
                            controller: context.read<RegisterCubit>().ageController,
                            prefixWidget: const Padding(
                                padding: EdgeInsets.all(8),
                                child: SmSvgPicture.asset(
                                    value: SMAssetPaths.ageIcon)),
                          ),
                          const SizedBox(height: SMDimens.size10),
                          SMInputField(
                            label: SMDisplayStrings.gender,
                            textHint: SMDisplayStrings.genderHint,
                            isRequired: true,
                            controller: context.read<RegisterCubit>().genderController,
                            prefixWidget: const Padding(
                                padding: EdgeInsets.all(8),
                                child: SmSvgPicture.asset(
                                    value: SMAssetPaths.genderIcon)),
                          ),
                          const SizedBox(height: SMDimens.size10),
                          SMInputField(
                            label: SMDisplayStrings.major,
                            textHint: SMDisplayStrings.majorHint,
                            isRequired: true,
                            controller: context.read<RegisterCubit>().majorController,
                            prefixWidget: const Padding(
                                padding: EdgeInsets.all(8),
                                child: SmSvgPicture.asset(
                                    value: SMAssetPaths.majorIcon)),
                          ),
                          const SizedBox(height: SMDimens.size10),
                          SMInputField(
                            label: SMDisplayStrings.durationOfHypertension,
                            textHint: SMDisplayStrings.durationOfHypertensionHint,
                            isRequired: true,
                            controller: context.read<RegisterCubit>().durationOfHypertensionController,
                            prefixWidget: const Padding(
                                padding: EdgeInsets.all(8),
                                child: SmSvgPicture.asset(
                                    value: SMAssetPaths.healthIcon)),
                          ),
                          const SizedBox(height: SMDimens.size10),
                          SizedBox(
                            width: double.infinity,
                            child: SMButtonFill.primaryMedium(
                              text: SMDisplayStrings.login,
                              onPressed: () {
                                if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
                                  context.read<RegisterCubit>().register(
                                    registerEntity:  RegisterEntity(
                                     email: context.read<RegisterCubit>().emailController.text,
                                     password: context.read<RegisterCubit>().passwordController.text,
                                     // name: context.read<RegisterCubit>().nameController.text,
                                     // age: context.read<RegisterCubit>().ageController.text,
                                     // gender: context.read<RegisterCubit>().genderController.text,
                                     // major: context.read<RegisterCubit>().majorController.text,
                                     // durationOfHypertension: context.read<RegisterCubit>().durationOfHypertensionController.text,
                                     // jobTitle: context.read<RegisterCubit>().jobTitleController.text,
                                      phoneNumber: context.read<RegisterCubit>().phoneNumberController.text.trim().toString()
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
                              text: SMDisplayStrings.haveAccount,
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
