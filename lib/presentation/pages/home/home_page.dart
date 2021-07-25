import 'package:auto_route/auto_route.dart';
import 'package:challenge/presentation/core/assets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../application/auth/auth_module.dart';
import '../../../injection.dart';
import '../../core/colors.dart';
import '../../routes/router.gr.dart';

const gitLink = 'https://github.com/Rosa17a/challenge_mobx';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authModule = getIt<AuthModule>();

    return Observer(
      name: HomePageRoute.name,
      builder: (BuildContext context) {
        return Scaffold(
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
          body: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.homeBackground),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.blackB.withOpacity(0.3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.developedBy,
                          style: Theme.of(context).primaryTextTheme.headline6,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(context)!
                                    .findTheSourceCode,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline6,
                              ),
                              TextSpan(
                                text: AppLocalizations.of(context)!.here,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline6
                                    ?.copyWith(
                                        decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    if (await canLaunch(gitLink)) {
                                      await launch(gitLink);
                                    }
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
