import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wan_test/Modles/userModel.dart';
import 'package:wan_test/ViewModels/welcomeVM.dart';
import 'package:wan_test/Views/pages/welcome_page.dart';
import 'package:wan_test/database/db.dart';
import 'package:wan_test/Views/pages/home_page.dart';
import 'package:wan_test/Views/pages/login_page.dart';
import 'package:wan_test/ViewModels/signinVM.dart';

class SinginPage extends StatefulWidget {
  SinginPage({super.key});

  @override
  State<SinginPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<SinginPage> {
  signinVM data = signinVM();
  //SqlDb sql = SqlDb();
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
                } else if (value!.length >= 100) {
                  return 'اسمك الرباعي طويل جدا';
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
                } else if (value!.length > 9) {
                  return "رقم الهوية لا يمكن ان يكون اكبر من 9اعداد";
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
                } else if (value!.length > 9) {
                  return "رقم الهاتف لا يمكن ان يكون اكبر من 9 اعداد";
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
                } else if (!value!.contains('@')) {
                  return 'يجب ان يحتوي بريدك الالكتروني على @';
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
                } else if (value!.length >= 50) {
                  return 'عنوانك الشخصي طويل جدا';
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
                } else if (value!.length > 20) {
                  return 'اسم المستخدم لا يجب ان يكون اكبر من 20 حرف';
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
                } else if (value!.length > 16) {
                  return ' ';
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
                  onPressed: () async {
                    if (formstate.currentState!.validate()) {
                      //print(idCont.text);
                      UserModel user = UserModel(
                        name: userNameCont.text,
                        password: passwordCont.text,
                        fullName: fullNameCont.text,
                        phoneNum: int.parse(phoneNumCont.text),
                        idNumCard: int.parse(idCont.text),
                        email: emailCont.text,
                        address: addCont.text,
                        gender: gender == 'Male' ? 1 : 0,
                        image: 'null',
                      );
                      String loginState = await data.signIN(user);
                      /*if (loginState == 'تم تسجيلك بنجاح') {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => WelcomePage()),
                            (route) => false);
                      }*/

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          showCloseIcon: true,
                          backgroundColor: loginState == loginState
                              ? Colors.red
                              : Colors.green,
                          content: Text(loginState.toString())));
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
