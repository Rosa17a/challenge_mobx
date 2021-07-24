import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../application/auth/auth_module.dart';
import '../../injection.dart';
import '../core/observable_listener.dart';
import '../routes/router.gr.dart';
import 'widgets/sign_in_form.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authModule = getIt<AuthModule>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
        automaticallyImplyLeading: false,
      ),
      body: ObserverListener(
        listener: (_) {
          authModule.authFailureOrSuccessOption?.fold(
            () {},
            (either) => either?.fold(
              (failure) {
                FlushbarHelper.createError(
                    message: failure.map(
                  canceledByUser: (_) => 'Canceled',
                  serverError: (_) => 'Server error',
                  emailAlreadyInUse: (_) => 'Email already in use',
                  invalidEmailAndPasswordCombination: (_) =>
                      'Invalid email and password combination',
                ))
                  ..show(context);
              },
              (_) {
                context.router.replace(const HomePageRoute());
                authModule.cacheUserData();
              },
            ),
          );
        },
        child: SignInForm(authModule: authModule),
      ),
    );
  }
}
