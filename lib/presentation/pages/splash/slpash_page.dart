import 'package:auto_route/auto_route.dart';
import 'package:challenge/presentation/core/colors.dart';
import 'package:flutter/material.dart';

import '../../../application/auth/auth_module.dart';
import '../../../injection.dart';
import '../../core/observable_listener.dart';
import '../../routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authModule = getIt<AuthModule>();
    return ObserverListener(
      listener: (_) async {
        await authModule.authCheckRequest();
        // await authModule.signOut();

        switch (authModule.authState) {
          case AuthState.Unauthenticated:
            context.router.replace(const SigninPageRoute());
            break;
          case AuthState.Authenticated:
            context.router.replace(const HomePageRoute());
            break;
          default:
            context.router.replace(const SigninPageRoute());
        }
      },
      //TODO add
      child: const Scaffold(
        backgroundColor: AppColors.blueDeep,
        body: Center(
          child: CircularProgressIndicator(
            color: AppColors.orangeRed,
          ),
        ),
      ),
    );
  }
}