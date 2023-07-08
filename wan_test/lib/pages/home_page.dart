import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wan Test"),
      ),
      drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
              accountName: Text("accountName"),
              accountEmail: Text("accountEmail")),
          Column(children: [
            ListTile(
              title: Text("Money"),
            )
          ]),
        ]),
      ),
      body: Column(children: [
        ListTile(
          title: Text("Money"),
        )
      ]),
    );
  }
}
