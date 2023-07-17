import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wan_test/Views/pages/login_page.dart';
import 'package:wan_test/Views/pages/singin_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

class bill_page extends StatelessWidget {
  bill_page({super.key});
  var couines = [
    DropdownMenuEntry(label: 'ريال يمني', value: 'ريال يمني'),
    DropdownMenuEntry(label: 'ريال سعودي', value: 'ريال سعودي'),
    DropdownMenuEntry(label: "دولار امريكي", value: "دولار امريكي"),
    DropdownMenuEntry(label: 'درهم امارتي', value: 'درهم امارتي'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("سداد فاتورة"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          //key: formstate,
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'رقم الحساب';
                  }
                  return null;
                },
                //controller: userCont,

                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 25.0),
                decoration: InputDecoration(
                  contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.account_balance,
                    color: Colors.grey,
                    size: 40,
                  ),
                  hintText: 'رقم الحساب',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,

                validator: (value) {
                  if (value!.isEmpty) {
                    return "المبلغ";
                  }
                  return null;
                },
                //controller: passwordCont,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 25.0),
                decoration: InputDecoration(
                  contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.balance,
                    color: Colors.grey,
                    size: 40,
                  ),
                  hintText: "المبلغ",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'العملة',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  Icon(
                    FontAwesomeIcons.dollarSign,
                    color: Colors.grey,
                    size: 40,
                  ),
                ],
              ),
            ),
            DropdownMenu(
              dropdownMenuEntries: couines,
              hintText: "اختر نوع العملة",
              label: Text("العملة"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 120, 170, 223)),
                  onPressed: () {},
                  child: const Text(
                    'تسديد',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
