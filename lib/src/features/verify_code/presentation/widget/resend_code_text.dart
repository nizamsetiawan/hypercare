import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../cubit/verify_code_cubit.dart';
import '/src/core/theming/styles.dart';
import '/src/featuers/verify_code/presentation/cubit/verify_code_cubit.dart';

class ResendCodeText extends StatefulWidget {
  final String phoneNumber;
  const ResendCodeText({super.key, required this.phoneNumber});

  @override
  State<ResendCodeText> createState() => _ResendCodeTextState();
}

class _ResendCodeTextState extends State<ResendCodeText> {
  Timer? _timer;
  int _remainingTime = 120;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyCodeCubit, VerifyCodeState>(
      builder: (context, state) {
        if (state is ResendedCode) {
          startTimer();
        }
        if (state is WrongSendCode) {
          // TODO create Error Widget
        }
        return RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Send code again  ',
                style: TextStyles.font14GraySemiBold,
              ),
              TextSpan(
                text: formattedTime != '0:00' ? formattedTime : 'Resend',
                style: formattedTime != '0:00'
                    ? TextStyles.font14GrayRegular
                    : TextStyles.font14BlackSemiBold,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => context
                      .read<VerifyCodeCubit>()
                      .resendCode(widget.phoneNumber),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String get formattedTime {
    int minutes = _remainingTime ~/ 60;
    int seconds = _remainingTime % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
