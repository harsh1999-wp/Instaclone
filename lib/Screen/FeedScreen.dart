import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_clone/components/color.dart';

import '../components/Post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        title: SvgPicture.asset('assets/instagram.svg',color: primaryColor,height: 32,),
        actions:[
          IconButton(onPressed: (){}, icon: Icon(Icons.messenger_outline_rounded),),
        ]
      ),
      body: Post_card(),
    );
  }
}
