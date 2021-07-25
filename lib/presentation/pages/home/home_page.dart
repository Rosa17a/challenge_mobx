import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../application/auth/auth_module.dart';
import '../../../injection.dart';
import '../../core/colors.dart';
import '../../routes/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authModule = getIt<AuthModule>();
    return Observer(
        name: HomePageRoute.name,
        builder: (BuildContext context) {
          return Scaffold(
            body: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/images/home_background.png',
                  fit: BoxFit.cover,
                )),
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.welcome,
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline5
                    ?.copyWith(color: AppColors.white),
              ),
              actions: [
                IconButton(
                  onPressed: () async {
                    await authModule.signOut();

                    if (authModule.authState == AuthState.Unauthenticated) {
                      context.router.replace(const SigninPageRoute());
                    }
                  },
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: AppColors.white,
                  ),
                )
              ],
            ),
          );
        });
  }
}
