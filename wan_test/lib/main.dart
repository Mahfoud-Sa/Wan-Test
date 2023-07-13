import 'package:flutter/material.dart';
import 'package:wan_test/database/db.dart';
import 'package:wan_test/pages/home_page.dart';
import 'package:wan_test/pages/personal_detailes.dart';
import 'package:wan_test/pages/welcome_page.dart';
import 'package:provider/provider.dart';

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
              darkTheme: ThemeData.dark().copyWith(
                  textTheme: Typography().white.apply(fontFamily: 'CairoPlay')),
              theme: ThemeData(
                fontFamily: 'CairoPlay',
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: WelcomePage(),
            );
          },
        ));
  }
}
