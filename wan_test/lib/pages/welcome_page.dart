import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wan_test/pages/login_page.dart';
import 'package:wan_test/pages/singin_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
                viewportFraction: 100,
                aspectRatio: 0),
            items: [1, 2, 3, 4, 5, 6, 7, 8].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(
                    "assets/images/welcome_$i.jpg",
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 200,
                  );
                },
              );
            }).toList(),
          ),
          const Text(
            "_مرحبا بكم في تطبيق _اسم التطبيق_",
            style: TextStyle(fontSize: 20),
          ),
          Text("قم بالدخول او سجل الدخول "),
          ElevatedButton.icon(
            icon: FaIcon(FontAwesomeIcons.google),
            onPressed: () {},
            label: Text(
              "سجل الدخول مع قوقل",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ElevatedButton.icon(
            icon: FaIcon(FontAwesomeIcons.facebook),
            onPressed: () {},
            label: Text(
              "سجل الدخول مع فيسبوك",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 37, 77)),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    "تسجيل الدخول",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 120, 170, 223)),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SinginPage(),
                      ),
                    );
                  },
                  child: Text(
                    "التسجيل",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
