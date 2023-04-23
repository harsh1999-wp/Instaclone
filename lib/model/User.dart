
class User{

  final String email;
  final String uid;
  final String photourl;
  final String username;
  final String bio;


 const User({required this.email, required this.uid, required this.photourl,required this.username,required this.bio,});

Map<String,dynamic> toJson() =>{
  'username': username,
  'uid':uid,
  'email':email,
  'bio':bio,
  'followers':[],
  'following':[],
  'photourl':photourl,
 };
}