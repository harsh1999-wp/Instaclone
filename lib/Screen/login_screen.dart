import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_clone/Screen/signup_screen.dart';

import '../components/color.dart';
import '../components/text_field.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                Flexible(child: Container(),flex: 2),
                SvgPicture.asset('assets/instagram.svg',color:primaryColor,height: 64,),
                SizedBox(height: 64,),
                Textfield(textInputType: TextInputType.emailAddress, hintText: 'Enter the email', textEditingController: _emailController),
                SizedBox(height: 34,),
                Textfield(textInputType: TextInputType.emailAddress, hintText: 'Enter the password', textEditingController: _passwordController,isPass: true,),
                SizedBox(height: 35,),
                InkWell(
                  // TODO: remove gesturedetector
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Signupscreen()),);
                    },
                    child: Container(
                      child: const Text('Log in'),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                        color: blueColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12,),
                Flexible(child: Container(), flex: 2,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(child: Text("Don't have account?"),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    ),
                    GestureDetector(onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Signupscreen(),),);
                    },child: Text(" Sign up",style: TextStyle(fontWeight: FontWeight.bold),)),
                  ],
                ),
              ]
          ),
        ),
      ),
    );
  }
}

