import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:challenge/presentation/core/colors.dart';
import 'package:challenge/presentation/core/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:provider/provider.dart';

import '../../../application/auth/auth_module.dart';
import '../../../application/core/locale_store.dart';
import '../../../injection.dart';
import '../../core/observable_listener.dart';
import '../../routes/router.gr.dart';
import 'widgets/curved_line_painter.dart';
import 'widgets/sign_in_form.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authModule = getIt<AuthModule>();
    // final localeStore = Provider.of<LocaleStore>(context);

    return Scaffold(
      backgroundColor: AppColors.blueDeep,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: _SignInAppBar(),
      ),
      body: ObserverListener(
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

class _SignInAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedLineClipper(),
      child: Container(
        height: 150,
        color: AppColors.purple,
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 20),
        child: Row(
          children: [
            Text(
              'Brand \nLogo',
              style: Theme.of(context).primaryTextTheme.headline5?.copyWith(
                    color: AppColors.white,
                    fontWeight: AppFontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
