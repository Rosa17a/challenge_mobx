import 'package:auto_route/auto_route.dart';

import '../home/home_page.dart';
import '../sign_in/sign_in_page.dart';
import '../splash/slpash_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SigninPage),
    MaterialRoute(page: HomePage)
  ],
)
class $AppRouter {}
