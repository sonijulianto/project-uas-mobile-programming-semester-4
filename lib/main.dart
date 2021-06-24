import 'package:flutter/material.dart';
import 'package:submission_flutter_pemua/helpers/user_info.dart';
import 'package:submission_flutter_pemua/pages/home_page.dart';
import 'package:submission_flutter_pemua/pages/iklan_page.dart';
import 'package:submission_flutter_pemua/pages/sign_in_page.dart';
import 'package:submission_flutter_pemua/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Widget page = CircularProgressIndicator();

  // @override
  // void initState() {
  //   super.initState();
  //   isLogin();
  // }

  // void isLogin() async {
  //   var token = await UserInfo().getToken();
  //   if (token != null) {
  //     setState(() {
  //       page = HomePage();
  //     });
  //   } else {
  //     setState(() {
  //       page = SignInPage();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // routes: {
      //   '/sign-in': (context) => SignInPage(),
      //   '/sign-up': (context) => SignUpPage(),
      //   '/home': (context) => HomePage(),
      // },
    );
  }
}
