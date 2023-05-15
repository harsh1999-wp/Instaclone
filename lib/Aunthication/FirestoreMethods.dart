import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_clone/Aunthication/storageMethod.dart';
import 'package:uuid/uuid.dart';
import '../model/Posts.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String discription,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = 'Some Error Occurred';
    try {
      String photourl = await storageMethod().UploadImageToStorage('post', file, true);

      String postId = const Uuid().v1();
      Post post = Post(
          uid: uid,
          photourl: photourl,
          discription: discription,
          username: username,
          postId:postId,
          datePublished: DateTime.now(),
          profImage: profImage,
          likes: []);

      _firestore.collection('posts').doc(postId).set(
            post.toJson(),);
      res = "success";
    } catch (err) {
       res = err.toString();
    }
    return res;
  }
}
