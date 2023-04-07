import 'package:flutter/material.dart';
import 'package:setup_provider/presentation/view/pages/auth/login_page.dart';

import 'view/pages/main/main_page.dart';

abstract class AppRoute {
  AppRoute._();

  static goMain(BuildContext context) =>
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const MainPage(),
        ),
        (route) => false,
      );

  static goLogin(BuildContext context) =>
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const LoginPage(),
        ),
        (route) => false,
      );

}
