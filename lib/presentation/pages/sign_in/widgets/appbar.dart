import 'package:challenge/presentation/core/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:provider/provider.dart';

import '../../../../application/core/locale_store.dart';
import '../../../core/colors.dart';
import '../sign_in_styles.dart';
import 'curved_line_painter.dart';

class SignInAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localeStore = Provider.of<LocaleStore>(context);
    return ClipPath(
      clipper: CurvedLineClipper(),
      child: Container(
        height: SignInStyles().appBarHeight,
        width: MediaQuery.of(context).size.width,
        color: AppColors.purple,
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.brandLogo.toUpperCase(),
              style: Theme.of(context).primaryTextTheme.headline5?.copyWith(
                    color: AppColors.white.withOpacity(0.7),
                    fontWeight: AppFontWeight.bold,
                  ),
            ),
            TextButton(
                onPressed: () {
                  localeStore.toggleLocale();
                },
                child: Text(!localeStore.isHY ? '🇺🇸' : '🇦🇲',
                    style: Theme.of(context).primaryTextTheme.headline5))
          ],
        ),
      ),
    );
  }
}
