import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wan_test/Modles/userModel.dart';
import 'package:wan_test/ViewModels/personal_detailesVM.dart';
import 'package:wan_test/Views/pages/welcome_page.dart';
import 'package:wan_test/database/db.dart';
import 'package:wan_test/Views/pages/home_page.dart';
import 'package:wan_test/Views/pages/login_page.dart';
import 'package:wan_test/Views/pages/personal_detailes_edit_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalDetailesPage extends StatefulWidget {
  PersonalDetailesPage({super.key});

  @override
  State<PersonalDetailesPage> createState() => _PersonalDetailesPageState();
}

class _PersonalDetailesPageState extends State<PersonalDetailesPage> {
  final formstate = GlobalKey<FormState>();

  TextEditingController passwordConfirmCont = TextEditingController();

  PersonalDetailesVM data = PersonalDetailesVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("البيانات الشخصية"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => PersonalDetailesEditPage()),
                    (route) => false);
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: data.getCurrentUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage:
                          AssetImage("assets/images/welcome_1.jpg"),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text('اسم المستخدم'),
                        ),
//full name
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            snapshot.data!.fullName!,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("رقم الهوية"),
                        ),
//id number
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            snapshot.data!.idNumCard!.toString(),
                            style: TextStyle(fontSize: 20),
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
                          child: Text(
                            snapshot.data!.phoneNum!.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("الايميل"),
                        ),
//email
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            snapshot.data!.email!,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("العنوان"),
                        ),
//العنوان
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            snapshot.data!.address!,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("اسم المستخدم"),
                        ),
//user name
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            snapshot.data!.name!,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("كلمة السر"),
                        ),
// password
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            snapshot.data!.password!,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Column(
                                      children: [
                                        Form(
                                            key: formstate,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text('حذف حسابي'),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      'هل انت متاكد من انك تريد حذف حسابك؟'),
                                                ),
                                                Text(
                                                    'ادخل رمزك السري للمتابعة\nسيتم حذف جميع بياناتك المرتبطة'),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 50.0),
                                                  child: TextFormField(
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "كلمة السر";
                                                      }
                                                      return null;
                                                    },
                                                    controller:
                                                        passwordConfirmCont,
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                        fontSize: 10.0),
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          new EdgeInsets
                                                                  .symmetric(
                                                              vertical: 0.0),
                                                      border: InputBorder.none,
                                                      suffixIcon: Icon(
                                                        Icons.key,
                                                        color: Colors.grey,
                                                      ),
                                                      hintText: "كلمة السر",
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text('الغاء')),
                                                    TextButton(
                                                        onPressed: () async {
                                                          if (formstate
                                                              .currentState!
                                                              .validate()) {
                                                            String deleteState =
                                                                await data.deleteMyAccount(
                                                                    passwordConfirmCont
                                                                        .text);
                                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                showCloseIcon:
                                                                    true,
                                                                backgroundColor:
                                                                    deleteState !=
                                                                            'تم حذف حسابك بنجاح'
                                                                        ? Colors
                                                                            .red
                                                                        : Colors
                                                                            .green,
                                                                content: Text(
                                                                    deleteState)));
                                                            Navigator.pop(
                                                                context);
                                                            if (deleteState ==
                                                                'تم حذف حسابك بنجاح') {
                                                              Navigator.of(
                                                                      context)
                                                                  .pushAndRemoveUntil(
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              WelcomePage()),
                                                                      (route) =>
                                                                          false);
                                                            }
                                                          }
                                                        },
                                                        child: Text('موافق'))
                                                  ],
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text('حذف حسابي'))
                      ],
                    )
                  ],
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return CircularProgressIndicator();
          },
        ));
  }
}
