import 'package:auto_route/auto_route.dart';
import 'package:challenge/presentation/core/colors.dart';
import 'package:challenge/presentation/core/typography/typography.dart';
import 'package:challenge/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../application/auth/auth_module.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key? key,
    required this.authModule,
  }) : super(key: key);

  final AuthModule authModule;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Form(
        autovalidateMode: authModule.autovalidate
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsets.only(left: 35, right: 35, top: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyText2
                      ?.copyWith(color: AppColors.akaroa),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,
                          color: authModule.emailFieldHasFocus
                              ? AppColors.orangeRed
                              : AppColors.orangeRedMuted),
                      hintText: AppLocalizations.of(context)!.email),
                  autocorrect: false,
                  onTap: authModule.emailFieldPresses,
                  onChanged: (value) =>
                      authModule.emailChanged(emailStr: value),
                  validator: (_) => authModule.emailAddress?.value.fold(
                    (f) => f.maybeMap(
                        invalidEmail: (_) =>
                            AppLocalizations.of(context)!.invalidEmail,
                        orElse: () {}),
                    (r) => null,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyText2
                      ?.copyWith(color: AppColors.akaroa),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock,
                        color: authModule.passwordFieldHasFocus
                            ? AppColors.orangeRed
                            : AppColors.orangeRedMuted),
                    hintText: AppLocalizations.of(context)!.password,
                  ),
                  autocorrect: false,
                  obscureText: true,
                  onTap: authModule.passwordFieldPresses,
                  onChanged: (value) =>
                      authModule.passwordChanged(passwordStr: value),
                  validator: (_) => authModule.password?.value.fold(
                    (f) => f.maybeMap(
                        shortPassword: (_) =>
                            AppLocalizations.of(context)!.shortPassword,
                        orElse: () {}),
                    (r) => null,
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppColors.blueGrey,
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                print('ss');
                                authModule.signInWithEmailAndPasswordPresses();
                              },
                              child: _AuthButton(
                                title: AppLocalizations.of(context)!.login,
                              )),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              authModule.registerWithEmailAndPasswordPresses();
                            },
                            child: _AuthButton(
                              title: AppLocalizations.of(context)!.signup,
                            ),
                          )
                        ],
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 250),
                      left: authModule.buttonIndex == 0
                          ? 0
                          : MediaQuery.of(context).size.width / 2 - 70,
                      child: GestureDetector(
                        onTap: authModule.buttonIndex == 0
                            ? authModule.signInWithEmailAndPasswordPresses
                            : authModule.registerWithEmailAndPasswordPresses,
                        child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                                color: AppColors.orangeRed,
                                borderRadius: BorderRadius.circular(100)),
                            child: _AuthButton(
                              title: authModule.buttonIndex == 0
                                  ? AppLocalizations.of(context)!.login
                                  : AppLocalizations.of(context)!.signup,
                            )),
                      ),
                    ),
                  ],
                ),
                if (authModule.isSubmitting) ...[
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(
                    color: AppColors.orangeRed,
                    backgroundColor: AppColors.blueGrey,
                    minHeight: 5,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  final String title;
  const _AuthButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
        title,
        style: Theme.of(context)
            .primaryTextTheme
            .bodyText1
            ?.copyWith(color: AppColors.white, fontWeight: AppFontWeight.bold),
      ),
    );
  }
}
