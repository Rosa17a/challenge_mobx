import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../application/core/locale_store.dart';
import '../../../injection.dart';
import '../../routes/router.gr.dart';
import '../themes.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _router = AppRouter();
    return MultiProvider(
      providers: [
        Provider<LocaleStore>(create: (_) => getIt<LocaleStore>()..getLocale())
      ],
      child: Consumer<LocaleStore>(
        builder: (_, LocaleStore value, __) => Observer(
          name: 'Locale-store',
          builder: (_) => MaterialApp.router(
            title: 'Challenge',
            debugShowCheckedModeBanner: false,
            theme: DefaultTheme.standard,
            locale: value.locale,

            // Localizations delegates.
            localizationsDelegates: AppLocalizations.localizationsDelegates,

            // Suppoted locales.
            supportedLocales: AppLocalizations.supportedLocales,

            routerDelegate: _router.delegate(),
            routeInformationParser: _router.defaultRouteParser(),
          ),
        ),
      ),
    );
  }
}
