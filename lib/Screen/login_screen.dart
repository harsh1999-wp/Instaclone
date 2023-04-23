import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_clone/Aunthication/auth_method.dart';
import 'package:insta_clone/Responsive/mobile_Screen.dart';
import 'package:insta_clone/Screen/signup_screen.dart';
import 'package:insta_clone/components/utils.dart';

import '../Responsive/Responsive_layout.dart';
import '../Responsive/Web_Screen.dart';
import '../components/color.dart';
import '../components/text_field.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isloading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async{
    setState(() {
      _isloading =true;
    });
    String res= await AuthMethod().loginUser(email: _emailController.text, password: _passwordController.text);
  if(res == 'success'){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>mobile_Screen(),),);
  }
  else {
    showSnackBar(res, context);
    setState(() {
      _isloading =false;
    });
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32,),
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(flex: 2, child: Container()),
                SvgPicture.asset(
                  'assets/instagram.svg', color: primaryColor, height: 64,),
                const SizedBox(height: 64,),
                Textfield(textInputType: TextInputType.emailAddress,
                    hintText: 'Enter the email',
                    textEditingController: _emailController),
                const SizedBox(height: 34,),
                Textfield(textInputType: TextInputType.emailAddress,
                  hintText: 'Enter the password',
                  textEditingController: _passwordController,
                  isPass: true,),
                const SizedBox(height: 35,),
                InkWell(
                  onTap: loginUser,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      color: blueColor,
                    ),
                    child:_isloading ?const Center(
                      child: CupertinoActivityIndicator(color: primaryColor,),)
                        :const Text('Log in'),
                  ),
                ),
                const SizedBox(height: 12,),
                Flexible(flex: 2,child: Container(),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),child: const Text("Don't have account?"),
                    ),
                    GestureDetector(onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const Signupscreen(),),);
                    },
                        child: const Text(" Sign up",
                          style: TextStyle(fontWeight: FontWeight.bold),)),
                  ],
                ),
              ]
          ),
        ),
      ),
    );
  }
}
