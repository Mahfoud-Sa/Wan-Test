import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wan_test/ViewModels/loginVM.dart';
import 'package:wan_test/Views/pages/home_page.dart';
import 'package:wan_test/Views/pages/singin_page.dart';
import 'package:provider/provider.dart';
import '../../database/db.dart';
import '../../provider/appProvider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  @override
  State<LoginPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<LoginPage> {
  //SqlDb sql = SqlDb();
  final formstate = GlobalKey<FormState>();
  LoginVM data = new LoginVM();

  TextEditingController userCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('تسجيل الدخول'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text(
              'سجل الدخول الى حسابك',
              style: TextStyle(fontSize: 25),
            ),
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
                  controller: userCont,
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
                  obscureText: data.password_visivility,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "كلمة السر";
                    }
                    return null;
                  },
                  controller: passwordCont,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 25.0),
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          data.passwordVisivility();
                        });
                      },
                      icon: Icon(data.password_visivility
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
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
            Consumer<AppProbider>(
              builder: (context, provider, child) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 120, 170, 223)),
                    onPressed: () async {
                      if (await data.checkInternet()) {
                        if (formstate.currentState!.validate()) {
                          String loginState = await data.LogIn(
                              userCont.text.trim(), passwordCont.text.trim());
                          if (loginState == 'اهلا وسهلا') {
                            // data.LogIn(userCont.text, passwordCont.text);
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                (route) => false);
                          }
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              showCloseIcon: true,
                              backgroundColor: loginState != 'اهلا وسهلا'
                                  ? Colors.red
                                  : Colors.green,
                              content: Text(loginState)));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                showCloseIcon: true,
                                backgroundColor: Colors.red,
                                content: Text('تاكد من اتال الانترنت')));
                      }
                    },
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ));
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      showCloseIcon: true,
                      backgroundColor: Colors.orange,
                      content:
                          Text('تم ارسال رساله الى عنوان بريدك الالكتروني')));
                },
                child: Text(
                  'هل نسيت كلمة السر ؟',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            )
          ],
        ));
  }
}
