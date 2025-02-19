
import 'package:first_project/theme/theme_styles.dart';
import 'package:first_project/ui/pages/get_data_page/get_data_page.dart';
import 'package:first_project/ui/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';

class FirstProject extends StatelessWidget {
  const FirstProject({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      /*theme: ThemeData(
          textTheme: TextTheme(
              bodyMedium: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.sizeOf(context).height*.025,
                  fontWeight: FontWeight.w800
              )
          )
      ),*/
      home:SignUpScreen(),
    );
  }
}