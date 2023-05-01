import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post{

  final String discription;
  final String uid;
  final String photourl;
  final String username;
  final datePublished;
  final String profImage;
  final likes;


  const Post(
      {
        required this.uid,
        required this.photourl,
        required this.username,
        required this.discription,
        required this.datePublished,
        required this.profImage,
        this.likes,
      }
      );

  Map<String,dynamic> toJson() =>{
    'username': username,
    'uid':uid,
    'discription':discription,
    'datePublish':datePublished,
    'profImage':profImage,
    'photourl':photourl,
    'likes':likes,
  };

  static Post fromSnap(DocumentSnapshot snap){
    var snapshot =snap.data() as Map<String,dynamic>;

    return Post( uid: snapshot['uid'], photourl: snapshot['photourl'], username: snapshot['username'], likes: snapshot['likes'], discription: snapshot['discription'], datePublished:snapshot ['datePublished'], profImage: snapshot['profImage']);
  }
}