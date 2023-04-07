// ignore_for_file: await_only_futures

import 'package:flutter/material.dart';
import 'package:setup_provider/infastructura/servises/local_store.dart';
import 'package:setup_provider/presentation/view/pages/main/main_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  Future<bool> checkAuth() async {
    final token = await LocalStore.getToken();
    return token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkAuth(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data ?? false) {
              return const MainPage(); // mainPage
            } else {
              return const MainPage(); // loginPage
            }
          } else {
            return Scaffold(
              body: Center(
                child: Text("Splash",style: Theme.of(context).textTheme.labelMedium,),
              ),
            );
          }
        });
  }
}
