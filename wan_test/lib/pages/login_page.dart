import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../database/db.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<LoginPage> {
  SqlDb sql = SqlDb();
  final formstate = GlobalKey<FormState>();

  TextEditingController nameCont = TextEditingController();
  TextEditingController idCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('تسجيل الدخول'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text('سجل الدخول الى حسابك'),
            Form(
              key: formstate,
              child: Column(children: [
                // full name
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'اسم المستخدم';
                    }
                    return null;
                  },
                  controller: nameCont,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 40,
                    ),
                    hintText: 'اسم المستخدم',
                  ),
                ),
                //id
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "كلمة السر";
                    }
                    return null;
                  },
                  controller: idCont,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.phone,
                      color: Colors.grey,
                      size: 40,
                    ),
                    hintText: "كلمة السر",
                  ),
                ),
              ]),
            ),
          ],
        ));
  }
}
