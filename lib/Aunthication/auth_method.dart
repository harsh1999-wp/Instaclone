import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/Aunthication/storageMethod.dart';
import 'package:insta_clone/components/utils.dart';
import 'package:insta_clone/model/User.dart' as model;

class AuthMethod{

  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Future<model.User> getUSerDetails() async{
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =await _firestore.collection('user').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

 Future<String> signupUser ({
  required String email,
  required String password,
  required String bio,
   required String username,
  required Uint8List file,
}) async {
   String res = "Some error occurred";
   try {
     if (email.isNotEmpty || password.isNotEmpty || bio.isNotEmpty )
     {
       //register the user
       UserCredential cred = await _auth.createUserWithEmailAndPassword(
           email: email, password: password);
       print(cred.user!.uid);

       String photourl =await storageMethod().UploadImageToStorage('profilePics', file, false);

       model.User user=  const model.User(
           following: [],
           followers: [],
           username:'username',
           uid:'uid',
           email:'email',
           bio:'bio',
           photourl:'photourl'
       );
       // add user to database
       await _firestore.collection('user').doc(cred.user!.uid).set(user.toJson());


       // await _firestore.collection('user').add({
       //   'username':username,
       //   'uid':cred.user!.uid,
       //   'email':email,
       //   'bio':bio,
       //   'followers':[],
       //   'following':[],
       // });
     }
 } catch(err){
     res=err.toString();
       }
       return res;
}

// LOGIN USER
    Future<String> loginUser({
    required String email,
    required String password,
})async{
   String res="Some error occurred";
   try{
     if(email.isNotEmpty || password.isNotEmpty){
       await _auth.signInWithEmailAndPassword(email: email, password: password);
       res='success';
     }
     else{
       res="please enter all the field";
     }
   }catch(err){
     res=err.toString();
   }
   return res;
    }
}