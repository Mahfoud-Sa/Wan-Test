import 'package:flutter/material.dart';
import 'package:wan_test/database/db.dart';
import 'package:wan_test/Views/pages/home_page.dart';
import 'package:wan_test/Views/pages/personal_detailes.dart';
import 'package:wan_test/Views/pages/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:wan_test/provider/appProvider.dart';
import 'package:wan_test/thems/them.dart';
import '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppProbider(),
        child: Consumer<AppProbider>(
          builder: (context, provider, child) {
            return MaterialApp(
              title: 'WAN Test',
              themeMode: provider.themMode,
              darkTheme: darkTheme,
              theme: lightTheme,
              home: WelcomePage(),
            );
          },
        ));
  }
}
