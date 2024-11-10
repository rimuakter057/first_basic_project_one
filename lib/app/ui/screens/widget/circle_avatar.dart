import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final IconData icon;
  const CircleWidget({
    super.key,
    required this.size, required this.icon,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFFD1C4E9),
      radius: size.height*.07,
      child: Icon(icon,size: size.height*.08,color: Colors.black,),
    );
  }
}