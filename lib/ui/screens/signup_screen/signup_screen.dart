
import 'package:first_project/api_services/network_caller.dart';
import 'package:first_project/api_services/url/api_url.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/signup-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _SignUpLoading = false;
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final bodySmallStyle=Theme.of(context).textTheme.bodySmall;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Join With Us",
                  style:titleStyle,
                ),
                Text(
                  "Learn With Ostad Platform",
                 // style: head2TextStyle(context: context),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (value){
                    if(value?.trim().isEmpty??true){
                      return "Please enter email";
                    }return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                  validator: (value){
                    if(value?.trim().isEmpty??true){
                      return "Please enter First Name";
                    }return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  ),
                  validator: (value){
                    if(value?.trim().isEmpty??true){
                      return "Please enter Last Name";
                    }return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _mobileNumberController,
                  decoration: const InputDecoration(
                    hintText: 'Mobile Number',
                  ),
                  validator: (value){
                    if(value?.trim().isEmpty??true){
                      return "Please enter Mobile Number";
                    }return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: (value){
                    if(value?.trim().isEmpty??true){
                      return "Please enter Password";
                    }
                    if(value!.length<6){
                      return "Please enter Password minimum 6 character";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                // click button
                ElevatedButton(
                  onPressed: () {
                    print("success");
                   // Navigator.pushNamed(context, SignInScreen.routeName);
                    if(_formKey.currentState!.validate()){

                    }
                  },
                  child: const Text(
                    "Sign Up",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildSignInSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //api function
Future<void> signUpApi()async{
  _SignUpLoading = true;
  setState(() {

  });
  final NetworkResponse response = await NetworkCaller.getRequest(url: ApiUrl.productUrl);
  if(response.isSuccessful){}
  else{}
  }


  // build sign in section
  RichText _buildSignInSection() {
    return RichText(text: TextSpan(
        text: "Already have an account?",
        style:Theme.of(context).textTheme.bodySmall,
        children: [
          TextSpan(
            text: "Sign In",
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
            recognizer: TapGestureRecognizer()..onTap = (){
              Navigator.pop(context);
            },
          ),
        ]
    ),
    );
  }
  // dispose
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileNumberController.dispose();
    super.dispose();
  }
}
