import 'package:flutter/material.dart';
import 'package:wan_test/database/db.dart';
import 'package:wan_test/Views/pages/bill_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wan_test/Views/pages/personal_detailes.dart';
import 'package:provider/provider.dart';
import 'package:wan_test/Views/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/appProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Future<String> getAcount() async {
    SharedPreferences personShrpre = await SharedPreferences.getInstance();
    return personShrpre.get('email').toString();
  }

  Future<String> getFullName() async {
    List<String> account = [];
    SharedPreferences personShrpre = await SharedPreferences.getInstance();
    return personShrpre.get('fullName').toString();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اسم التطبيق"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(children: [
          Consumer<AppProbider>(
            builder: (context, value, child) {
              return UserAccountsDrawerHeader(
                  accountName: FutureBuilder(
                    future: getFullName(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data.toString());
                        }
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                  accountEmail: FutureBuilder(
                    future: getAcount(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data.toString());
                        }
                      }
                      return CircularProgressIndicator();
                    },
                  ));
            },
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => PersonalDetailesPage()),
                        (route) => false);
                  },
                  trailing: Icon(Icons.person_2_rounded),
                  subtitle: Text(
                    "استعراض وتعديل على بياناتك الشصية",
                    textAlign: TextAlign.end,
                  ),
                  title: Text(
                    "البيانات الشخصية",
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.star),
                  subtitle: Text(
                    "استكشف ميزات التطبيق",
                    textAlign: TextAlign.end,
                  ),
                  title: Text(
                    "ميزات التطبيق",
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.share),
                  subtitle: Text(
                    "مشاركة",
                    textAlign: TextAlign.end,
                  ),
                  title: Text(
                    "قم بدعوة الاصدقاء",
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.settings),
                  subtitle: Text(
                    "التعديل على اعدادات التطبيق",
                    textAlign: TextAlign.end,
                  ),
                  title: Text(
                    "اعدادات التطبيق",
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            )
          ]),
          Consumer<AppProbider>(
              builder: (context, provider, child) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            provider.changeTheme();
                          },
                          icon: provider.themMode == ThemeMode.light
                              ? Icon(Icons.dark_mode)
                              : Icon(Icons.light)),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => WelcomePage()),
                                (route) => false);
                          },
                          icon: Icon(Icons.logout)),
                    ],
                  ))
        ]),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => bill_page(),
                  ),
                );
              },
              titleAlignment: ListTileTitleAlignment.center,
              trailing: Icon(Icons.cases),
              title: Text(
                "سداد فاتورة",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              onTap: () {},
              titleAlignment: ListTileTitleAlignment.center,
              trailing: Icon(Icons.bakery_dining),
              title: Text(
                "تحويل الى حساب صرافة",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              onTap: () {},
              titleAlignment: ListTileTitleAlignment.center,
              trailing: Icon(Icons.done_all),
              title: Text(
                "استعلام عن الرصيد",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              onTap: () {},
              titleAlignment: ListTileTitleAlignment.center,
              trailing: Icon(Icons.sd_card),
              title: Text(
                "سداد التلفون",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              onTap: () {},
              titleAlignment: ListTileTitleAlignment.center,
              trailing: Icon(Icons.account_balance),
              title: Text(
                "كشف حساب",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
