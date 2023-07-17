import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wan_test/database/db.dart';
import 'package:wan_test/Views/pages/home_page.dart';
import 'package:wan_test/Views/pages/login_page.dart';
import 'package:wan_test/Views/pages/personal_detailes.dart';

class PersonalDetailesEditPage extends StatefulWidget {
  PersonalDetailesEditPage({super.key});

  @override
  State<PersonalDetailesEditPage> createState() =>
      _PersonalDetailesEditPageState();
}

class _PersonalDetailesEditPageState extends State<PersonalDetailesEditPage> {
  SqlDb sql = SqlDb();
  final formstate = GlobalKey<FormState>();
  TextEditingController fullNameCont = TextEditingController();
  TextEditingController idCont = TextEditingController();
  TextEditingController phoneNumCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController addCont = TextEditingController();
  TextEditingController userNameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController repasswordCont = TextEditingController();
  String? gender = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('المعلومات الشخصية'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => PersonalDetailesPage()),
                  (route) => false);
            },
          ),
        ),
        body: ListView(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/welcome_1.jpg"),
            ),
            Form(
                key: formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("اسم المستخدم"),
                    ),
                    //full name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: fullNameCont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'اكتب اسمك الرباعي';
                          }

                          return null;
                        },
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("رقم الهوية"),
                    ),
                    //id number
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: idCont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ادخل رقم الهوية';
                          }

                          return null;
                        },
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                    //phone number
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("رقم الهاتف"),
                    ),
                    //id number
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: phoneNumCont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ادخل رقم الهاتف';
                          }

                          return null;
                        },
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("الايميل"),
                    ),
                    //email
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailCont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ادخل الايميل ';
                          }

                          return null;
                        },
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("العنوان"),
                    ),
                    //العنوان
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: addCont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'دخل عنوانك';
                          }

                          return null;
                        },
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("اسم المستخدم"),
                    ),
                    //user name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: userNameCont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ادخل اسم المستخدم';
                          }

                          return null;
                        },
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("كلمة السر"),
                    ),
                    // password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: passwordCont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ادخل كلمة السر';
                          }

                          return null;
                        },
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("كرر كلمة السر"),
                    ),
                    // password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: passwordCont,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "كرر كلمة السر";
                          }
                          if (value != passwordCont.text) {
                            return 'كلمة المرور ليست مماثلة';
                          }
                          return null;
                        },
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(255, 120, 170, 223)),
                        onPressed: () {
                          if (formstate.currentState!.validate()) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                (route) => false);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    showCloseIcon: true,
                                    backgroundColor: Colors.green,
                                    content: Text('Done')));
                          }
                        },
                        child: const Text(
                          'حفظ',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )),
                  ],
                ))
          ],
        ));
  }
}
