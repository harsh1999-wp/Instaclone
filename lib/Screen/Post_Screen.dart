import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/Aunthication/FirestoreMethods.dart';
import 'package:insta_clone/components/color.dart';
import 'package:insta_clone/components/utils.dart';
import 'package:insta_clone/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../model/User.dart';

class Post_Screen extends StatefulWidget {
  const Post_Screen({Key? key}) : super(key: key);

  @override
  State<Post_Screen> createState() => _Post_ScreenState();
}

class _Post_ScreenState extends State<Post_Screen> {
  Uint8List? _file;
  final TextEditingController _discriptionController = TextEditingController();
  bool _isloading =  false;
  void postImage(
      String uid,
      String username,
      String profImage,
      )async{
    setState(() {
      _isloading =true;
    });
    try{
      String res =await FirestoreMethods().uploadPost(_discriptionController.text, _file!, uid, username, profImage);
      if(res == 'success'){
        setState(() {
          _isloading =false;
        });
        showSnackBar('Posted!', context);
      }else{
        setState(() {
        _isloading =true;
      });
        showSnackBar(res, context);
        clearImage();
      }
    }
    catch(err){
      showSnackBar(err.toString(), context);
    }
  }

  _selectImage(BuildContext context)async{
    return showDialog(context: context, builder: (context){
      return SimpleDialog(
        title: const Text('Create a Post'),
        children: [
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Take a photo'),
            onPressed: () async{
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.camera);
              setState(() {
                _file=file;
              });
            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Choose from Gallery'),
            onPressed: () async{
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.gallery);
              setState(() {
                _file=file;
              });
            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Choose from Gallery'),
            onPressed: () async{
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _discriptionController.dispose();
  }

  void clearImage(){
    setState(() {
      _file =null;
    });
  }

  @override
  Widget build(BuildContext context) {

    final User user = Provider.of<UserProvider>(context).getUser;

    return _file == null ?
    Center(
      child: IconButton(icon: const Icon(Icons.upload), onPressed: () =>_selectImage(context),
      ),
    )
    : Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(onPressed: () =>clearImage(), icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Post to'),
        centerTitle: false,
        actions: [
          ElevatedButton(onPressed:() =>postImage(user.uid, user.username, user.photourl), child: const Text('POST',style: TextStyle(color: Colors.white),),)
        ],
      ),
      body: Column(
        children: [
          _isloading ? const LinearProgressIndicator() : const Padding(padding: EdgeInsets.only(top: 0),),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              CircleAvatar(
                backgroundImage: NetworkImage(user.photourl,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.45,
                child: TextField(
                  controller: _discriptionController,
                  decoration:  const InputDecoration(
                    hintText: 'write a caption ',
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 2,
                width: 2,
                child:  AspectRatio(aspectRatio: 487/451,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: MemoryImage(_file!),
                      fit: BoxFit.fill,
                      alignment: FractionalOffset  .topCenter,
                    ),
                  ),
                ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
