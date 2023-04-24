import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/model/User.dart' as model;


import 'package:insta_clone/provider/user_provider.dart';
import 'package:provider/provider.dart';
class Web_Screen extends StatelessWidget {

  String username="";
  @override
  void initState() {
    // TODO: implement initState
    getUsername();
  }

  void getUsername() async{
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();

  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(child: Text(user.username,style: TextStyle(fontSize: 20.0),),
      ),
    );
  }
}