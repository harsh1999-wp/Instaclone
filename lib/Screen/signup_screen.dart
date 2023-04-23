import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/Aunthication/auth_method.dart';
import 'package:insta_clone/components/utils.dart';

import '../components/color.dart';
import '../components/text_field.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({Key? key}) : super(key: key);

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isloading =false;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isloading=true;
    });
    String res = await AuthMethod().signupUser(email: _emailController.text,
      password: _passwordController.text,
      bio: _bioController.text,
      username: _usernameController.text,
      file: _image!,);
    print(res);

    setState(() {
      _isloading=false;
    });

    if (res != 'sucess') {
      showSnackBar(res, context);
    }
    else {}
  }
    void selectImage() async {
      Uint8List im = await pickImage(ImageSource.gallery);
      setState(() {
        _image = im;
      });
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32,),
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Container(), flex: 2),
                  SvgPicture.asset(
                    'assets/instagram.svg', color: primaryColor, height: 64,),
                  SizedBox(height: 44,),

                  Stack(
                    children: [
                      _image != null ?
                      CircleAvatar(
                        radius: 74,
                        backgroundImage: MemoryImage(_image!),
                      )
                          : const CircleAvatar(
                        radius: 74,
                        backgroundImage: NetworkImage(
                            'https://static.vecteezy.com/system/resources/thumbnails/009/734/564/small/default-avatar-profile-icon-of-social-media-user-vector.jpg'),
                      ),
                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: selectImage,
                          icon: const Icon(
                            Icons.add_a_photo,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 64,),
                  Textfield(textInputType: TextInputType.text,
                    hintText: 'Enter the username',
                    textEditingController: _usernameController,),

                  const SizedBox(height: 35,),
                  Textfield(textInputType: TextInputType.emailAddress,
                      hintText: 'Enter the email',
                      textEditingController: _emailController),

                  const SizedBox(height: 34,),
                  Textfield(textInputType: TextInputType.text,
                    hintText: 'Enter the password',
                    textEditingController: _passwordController,
                    isPass: true,),

                  const SizedBox(height: 35,),
                  Textfield(textInputType: TextInputType.text,
                    hintText: 'Enter the bio',
                    textEditingController: _bioController,),

                  const SizedBox(height: 35,),
                  InkWell(
                    onTap: signUpUser,
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
                      child: _isloading? const Center(child: CircularProgressIndicator(
                        color: Colors.white,
                      ),):const Text('Sign up'),
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
                      GestureDetector(onTap: () {},
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