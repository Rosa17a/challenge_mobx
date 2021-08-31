import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:challenge/application/core/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:provider/provider.dart';

import '../../../application/auth/auth_module.dart';
import '../../../injection.dart';
import '../../core/widgets/observable_listener.dart';
import '../../routes/router.gr.dart';
import 'sign_in_styles.dart';
import 'widgets/appbar.dart';
import 'widgets/sign_in_form.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authModule = getIt<AuthModule>();
    final themeStore = Provider.of<ThemeStore>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: SignInStyles().appBarSize,
        child: SignInAppBar(),
      ),
      body: ObserverListener(
        name: SigninPageRoute.name,
        listener: (_) {
          authModule.authFailureOrSuccessOption?.fold(
            () {},
            (either) => either?.fold(
              (failure) {
                FlushbarHelper.createError(
                    message: failure.map(
                  canceledByUser: (_) => AppLocalizations.of(context)!.canceled,
                  serverError: (_) => AppLocalizations.of(context)!.serverError,
                  emailAlreadyInUse: (_) =>
                      AppLocalizations.of(context)!.emailAlreadyInUse,
                  invalidEmailAndPasswordCombination: (_) =>
                      AppLocalizations.of(context)!
                          .invalidEmailAndPasswordCombination,
                ))
                  ..show(context);
              },
              (_) {
                context.router.replace(const HomePageRoute());
              },
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: SignInForm(authModule: authModule),
            ),
            IconButton(
              onPressed: () {
                themeStore.toggleTheme();
              },
              icon: Icon(
                themeStore.isDark ? Icons.dark_mode : Icons.light_mode,
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
