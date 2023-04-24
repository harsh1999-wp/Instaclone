import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/components/color.dart';
import 'package:insta_clone/model/User.dart' as model;


import 'package:insta_clone/provider/user_provider.dart';
import 'package:provider/provider.dart';
class mobile_Screen extends StatefulWidget {

  @override
  State<mobile_Screen> createState() => _mobile_ScreenState();
}

class _mobile_ScreenState extends State<mobile_Screen> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController =PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void navigationTapped(int page) {
     pageController.jumpToPage(page);
  }


  @override
  Widget build(BuildContext context) {
    // model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: PageView(children: [
        Text('feed'),
        Text('serch'),
        Text('add'),
        Text('like'),
        Text('profile'),

      ],
        controller: pageController,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(icon: Icon(
            Icons.home, color: _page == 1 ? primaryColor : secondaryColor,),
            label: '',
            backgroundColor: primaryColor,),
          BottomNavigationBarItem(icon: Icon(
            Icons.search, color: _page == 2 ? primaryColor : secondaryColor,),
            label: '',
            backgroundColor: primaryColor,),
          BottomNavigationBarItem(icon: Icon(
              Icons.camera, color: _page == 3 ? primaryColor : secondaryColor),
            label: '',
            backgroundColor: primaryColor,),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,
              color: _page == 4 ? primaryColor : secondaryColor),
            label: '',
            backgroundColor: primaryColor,),
          BottomNavigationBarItem(icon: Icon(
              Icons.person, color: _page == 5 ? primaryColor : secondaryColor),
            label: '',
            backgroundColor: primaryColor,),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}



















// String username="";
// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   getUsername();
// }
//
// void getUsername() async{
//   DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
//
//   setState(() {
//     username =(snap.data() as Map<String,dynamic>)[username];
//   });
// }
