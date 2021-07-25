import 'package:challenge/presentation/pages/sign_in/sign_in_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../application/auth/auth_module.dart';
import '../../../core/colors.dart';
import '../../../core/typography/typography.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key? key,
    required this.authModule,
  }) : super(key: key);

  final AuthModule authModule;

  @override
  Widget build(BuildContext context) {
    final styles = SignInStyles();
    return Observer(
      name: 'Sign-in-form',
      builder: (context) {
        final bool loginMode = authModule.buttonIndex == 0;
        return Form(
          autovalidateMode: authModule.autovalidate
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Padding(
            padding: styles.formPadding,
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
                  styles.constHeight,
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
                  styles.constHeight,
                  Stack(
                    children: [
                      Container(
                        height: styles.buttonHeight,
                        decoration: styles.buttonDecoration,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    authModule
                                        .signInWithEmailAndPasswordPresses();
                                  },
                                  child: _AuthButton(
                                    opacity: !loginMode
                                        ? styles.halfOpacity
                                        : styles.fullOpacity,
                                    title: AppLocalizations.of(context)!.login,
                                  )),
                            ),
                            Expanded(
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  authModule
                                      .registerWithEmailAndPasswordPresses();
                                },
                                child: _AuthButton(
                                  opacity: loginMode
                                      ? styles.halfOpacity
                                      : styles.fullOpacity,
                                  title: AppLocalizations.of(context)!.signup,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      AnimatedPositioned(
                        duration: styles.animationDuration,
                        left: loginMode
                            ? 0
                            : MediaQuery.of(context).size.width / 2 -
                                styles.horizontalPadding,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: loginMode
                              ? authModule.signInWithEmailAndPasswordPresses
                              : authModule.registerWithEmailAndPasswordPresses,
                          child: Container(
                              height: styles.buttonHeight,
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: styles.animatiedBoxDecoration,
                              child: _AuthButton(
                                title: loginMode
                                    ? AppLocalizations.of(context)!.login
                                    : AppLocalizations.of(context)!.signup,
                              )),
                        ),
                      ),
                    ],
                  ),
                  if (authModule.isSubmitting) ...[
                    SizedBox(height: styles.loadingWidgetsdistance),
                    const LinearProgressIndicator(
                      color: AppColors.orangeRed,
                      backgroundColor: AppColors.blueGrey,
                      minHeight: SignInStyles.loadingWidgetHeight,
                    ),
                  ],
                  styles.constHeight,
                  TextButton(
                    onPressed: null,
                    child: Text(
                      AppLocalizations.of(context)!.forgotPassword,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1
                          ?.copyWith(
                              color: AppColors.orangeRedMuted,
                              fontWeight: AppFontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AuthButton extends StatelessWidget {
  final String title;
  final double opacity;
  const _AuthButton({
    Key? key,
    required this.title,
    this.opacity = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
        title,
        style: Theme.of(context).primaryTextTheme.bodyText1?.copyWith(
              color: AppColors.white.withOpacity(opacity),
              fontWeight: AppFontWeight.bold,
            ),
      ),
    );
  }
}
