import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/Aunthication/storageMethod.dart';
import 'package:insta_clone/components/utils.dart';

class AuthMethod{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

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

       // add user to database
       await _firestore.collection('user').doc(cred.user!.uid).set({
         'username':username,
         'uid':cred.user!.uid,
         'email':email,
         'bio':bio,
         'followers':[],
         'following':[],
         'photourl':photourl,
       });


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
}