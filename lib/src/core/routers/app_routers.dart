part of 'routers.dart';

class AppRouters {
  AppRouters();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutersNames.login:
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<LoginCubit>(),
                  child: const LoginPage(),
                ));

      case RoutersNames.signUp:
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<RegisterCubit>(),
                  child: const RegisterPage(),
                ));

      // case RoutersNames.home:
      //   return CupertinoPageRoute(
      //       builder: (_) => BlocProvider(
      //             create: (context) => HomeCubit(),
      //             child: const HomePage(),
      //           ));

      // case RoutersNames.verifyCode:
      //   final args = settings.arguments as VerifyCodePageArguments;
      //   return CupertinoPageRoute(
      //       builder: (_) => BlocProvider(
      //             create: (context) => sl<VerifyCodeCubit>(),
      //             child: VerifyCodePage(arguments: args),
      //           ));

      // case RoutersNames.forgetPassword:
      //   return CupertinoPageRoute(
      //       builder: (_) => BlocProvider(
      //             create: (context) => sl<ForgetPasswordCubit>(),
      //             child: const ForgetPasswordPage(),
      //           ));
    }

    return CupertinoPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => sl<LoginCubit>(),
              child: const LoginPage(),
            ));
  }
}
