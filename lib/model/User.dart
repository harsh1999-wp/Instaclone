import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User{

  final String email;
  final String uid;
  final String photourl;
  final String username;
  final String bio;
  final List followers;
  final List following;


 const User(
     {
       required this.followers,
       required this.following,
       required this.email,
       required this.uid,
       required this.photourl,
       required this.username,
       required this.bio,
     }
     );

Map<String,dynamic> toJson() =>{
  'username': username,
  'uid':uid,
  'email':email,
  'bio':bio,
  'followers':followers,
  'following':following,
  'photourl':photourl,
 };

// for getting version document
  static User fromSnap(DocumentSnapshot snap){
    var snapshot =snap.data() as Map<String,dynamic>;

    return User(followers: snapshot['followers'], following:snapshot['following'], email:snapshot['email'], uid: snapshot['uid'], photourl: snapshot['photourl'], username: snapshot['username'], bio: snapshot['bio']);
  }
}