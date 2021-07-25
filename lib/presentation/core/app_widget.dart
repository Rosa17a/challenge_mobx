
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../application/core/locale_store.dart';
import '../../injection.dart';
import '../routes/router.gr.dart';

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
          builder: (_) => MaterialApp.router(
            title: 'Challenge',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              primaryColor: Colors.green[800],
              accentColor: Colors.blueAccent,
              inputDecorationTheme: InputDecorationTheme(
                // labelStyle: TextStyle(color: Colors.green[800]),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.green[800]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.green[800]!),
                ),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.blue[900],
              ),
            ),
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
