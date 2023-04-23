import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/Responsive/Web_Screen.dart';
import 'package:insta_clone/Responsive/mobile_Screen.dart';
import 'package:insta_clone/Responsive/Responsive_layout.dart';
import 'package:insta_clone/Screen/login_screen.dart';
import 'package:insta_clone/Screen/signup_screen.dart';
import 'package:insta_clone/components/color.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(apiKey: "AIzaSyC5d6GQg0Rc1hNicXEoq98UdFYQmWUYCfA", appId: "AIzaSyC5d6GQg0Rc1hNicXEoq98UdFYQmWUYCfA", messagingSenderId: "205105846550", projectId: "1:205105846550:web:3ba81aac88df4256359837",storageBucket: "insta-clone-4986f.appspot.com",),
    );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insta',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: SafeArea(
      //   child: Scaffold(
      //     body:
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.active){
            if(snapshot.hasData){
              return Resposive_layout(webScreenLayout: Web_Screen(), mobileScreenLayout:Loginscreen());
              }
            else if(snapshot.hasError){
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: primaryColor,),);
          }
          return const Loginscreen();
          }

      ),
    );
  }
}

