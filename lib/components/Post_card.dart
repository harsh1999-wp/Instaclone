import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/components/color.dart';

class Post_card extends StatelessWidget {
  const Post_card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16).copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage('https://plus.unsplash.com/premium_photo-1666997726532-33f671ca24c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1121&q=80'
                  ),
                ),
                Expanded(
                    child:Padding(padding: EdgeInsets.only(left: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('username',style: TextStyle(fontWeight: FontWeight.bold
                          ),
                          ),
                        ],
                      ),
                    ),
                ),
                IconButton(onPressed:(){
                  showDialog(context: context, builder: (context) => Dialog(
                    child: ListView(
                    padding: const EdgeInsets.symmetric(vertical:  16),
                      shrinkWrap: true,
                      children: [
                        'Delete'
                      ].map((e) => InkWell(
                        onTap:(){} ,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                          child: Text(e),
                        ),
                      ),).toList(),
                    ),
                  ),
                  );
                },
                  icon: const Icon(Icons.more_vert_outlined),
                ),
              ],
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height*0.35,
              width: double.infinity,
              child: Image.network('https://images.unsplash.com/photo-1635399860495-2a2802a6df5e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MjB8WWM0R293Y1Z1SEV8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
              fit: BoxFit.cover,),
          ),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.favorite,color: Colors.red,),
              ),
                IconButton(onPressed: (){}, icon: const Icon(Icons.comment_outlined)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.send_outlined),),
              Expanded(child:Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(onPressed: () {  }, icon: const Icon(Icons.bookmarks_outlined),),
              )
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal:16 ,),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w800), child: Text('12312 likes',style: Theme.of(context).textTheme.bodyMedium,),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: primaryColor),
                      children: [
                        TextSpan(
                          text: 'username',
                          style: const TextStyle(fontWeight: FontWeight.bold,)
                        ),
                        TextSpan(text: ' Hey this is some description to be replaced',)
                      ]
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    child: Text('view all 200  comments ',style: const TextStyle(fontSize: 16, color: secondaryColor),)
                  ),
                ),
                Container(
                    child: Text('03/05/23 ',style: const TextStyle(fontSize: 16, color: secondaryColor),)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
