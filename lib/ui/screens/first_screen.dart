
import 'package:first_project/ui/screens/widget/circle_avatar.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var textMedium=Theme.of(context).textTheme.bodyMedium;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9A825),
        title: const Text("My Profile"),
        actions: [
          IconButton(onPressed: (){}, icon:const Icon(Icons.add)),
          IconButton(onPressed: (){}, icon:const Icon(Icons.settings)),
          IconButton(onPressed: (){}, icon:const Icon(Icons.call)),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.spaceBetween ,
          children: [
            Column(
              children: [
                SizedBox(height:size.height*.02,),
                CircleWidget(size: size, icon: Icons.icecream_outlined,),
                SizedBox(height:size.height*.02,),
                Text("Ice cream is very delicious right?",style: textMedium,),
              ],
            ),
            Column(
              children: [
                CircleWidget(size: size, icon: Icons.code,),
                SizedBox(height:size.height*.02,),
                Text("Programming is not boring if you love it",style: textMedium,),
              ],
            ),
            Column(
              children: [
                CircleWidget(size: size, icon: Icons.egg_outlined,),
                SizedBox(height:size.height*.02,),
                Text("if you submit code directly from chatgpt \nthen mark will 0",style: textMedium,),
              ],
            ),
          ],),
      ),
    );
  }
}


