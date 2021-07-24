import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../application/auth/auth_module.dart';
import '../../injection.dart';
import '../core/observable_listener.dart';
import '../routes/router.gr.dart';

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
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
