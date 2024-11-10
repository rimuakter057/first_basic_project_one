import 'package:flutter/material.dart';

import 'app/ui/screens/first_screen.dart';

void main() {
  runApp(const FirstProject());
}

class FirstProject extends StatelessWidget {
  const FirstProject({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.sizeOf(context).height*.025,
            fontWeight: FontWeight.w800
          )
        )
      ),
      home:const FirstScreen(),
    );
  }
}


