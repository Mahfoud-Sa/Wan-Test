import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wan_test/ViewModels/welcomeVM.dart';
import 'package:wan_test/Views/pages/login_page.dart';
import 'package:wan_test/Views/pages/singin_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});
  WelcomVM data = WelcomVM();
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
            items: data.welcomeImages.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(
                    imagePath,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 200,
                  );
                },
              );
            }).toList(),
          ),
          Text(
            data.title,
            style: TextStyle(fontSize: 20),
          ),
          Text(data.subTitle),
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
