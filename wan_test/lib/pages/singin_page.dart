import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wan_test/database/db.dart';
import 'package:wan_test/pages/home_page.dart';
import 'package:wan_test/pages/login_page.dart';

class SinginPage extends StatefulWidget {
  SinginPage({super.key});

  @override
  State<SinginPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<SinginPage> {
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
        title: const Text('انشاء حساب'),
        centerTitle: true,
      ),
      body: Form(
        key: formstate,
        child: ListView(
          children: [
            // full name
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'ادخل اسمك الرباعي';
                }
                return null;
              },
              controller: fullNameCont,
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
                hintText: 'اسمك الرباعي',
              ),
            ),

            //id
            TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "ادخل رقم هويتك";
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
                  Icons.perm_identity,
                  color: Colors.grey,
                  size: 40,
                ),
                hintText: 'رقم البطاقة',
              ),
            ),

            // phone Number
            TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'رقم الجوال';
                }
                return null;
              },
              controller: phoneNumCont,
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
                hintText: 'رقم الجوال',
              ),
            ),

            // email
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'ادخل بريدك الاكتروني';
                }
                return null;
              },
              controller: emailCont,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 25.0),
              decoration: InputDecoration(
                contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.email,
                  color: Colors.grey,
                  size: 40,
                ),
                hintText: 'الايميل',
              ),
            ),
            //address
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'ادخل عنوانك';
                }
                return null;
              },
              controller: addCont,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 25.0),
              decoration: InputDecoration(
                contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.location_city,
                  color: Colors.grey,
                  size: 40,
                ),
                hintText: 'العنوان',
              ),
            ),
            //user name
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'اسم المستخدم';
                }
                return null;
              },
              controller: userNameCont,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 25.0),
              decoration: InputDecoration(
                contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.person_2,
                  color: Colors.grey,
                  size: 40,
                ),
                hintText: 'اسم المستخدم',
              ),
            ),
            //كلمو السسر
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'كلمة السر';
                }
                return null;
              },
              controller: passwordCont,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 25.0),
              decoration: InputDecoration(
                contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.password,
                  color: Colors.grey,
                  size: 40,
                ),
                hintText: 'كلمة السر',
              ),
            ),
            //repeat password
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'كرر كلمة السر';
                }
                if (value != passwordCont.text) {
                  return 'كلمة المرور ليست مماثلة';
                }
                return null;
              },
              controller: repasswordCont,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 25.0),
              decoration: InputDecoration(
                contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.password_outlined,
                  color: Colors.grey,
                  size: 40,
                ),
                hintText: 'كرر كلمة السر',
              ),
            ),
            //Gender
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              const SizedBox(
                height: 20,
              ),
              const Text('الجنس : ',
                  textAlign: TextAlign.right, style: TextStyle(fontSize: 25.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Text('ذكر'),
                      Radio(
                        value: 'Male',
                        groupValue: gender,
                        onChanged: (String? value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('انثئ'),
                      Radio(
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (String? value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 120, 170, 223)),
                  onPressed: () {
                    if (formstate.currentState!.validate()) {
                      sql.insertData('''
                          INSERT INTO "persons" ( 'fullName','idNum','phoneNum','e_mail','address','usrName',password,gender)
                          VALUES ("${fullNameCont.text}","${idCont.text}","${phoneNumCont.text}","${emailCont.text}","${addCont.text}","${userNameCont.text}","${passwordCont.text}","${gender}")
                          ''');

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          showCloseIcon: true,
                          backgroundColor: Colors.green,
                          content: Text('Done')));
                    }
                  },
                  child: const Text(
                    'تسجيل',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
