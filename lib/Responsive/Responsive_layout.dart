import 'package:flutter/material.dart';
import 'package:insta_clone/provider/user_provider.dart';
import 'package:provider/provider.dart';
import '../components/dimensionals.dart';

class Resposive_layout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  Resposive_layout({required this.webScreenLayout,required this.mobileScreenLayout});

  @override
  State<Resposive_layout> createState() => _Resposive_layoutState();
}

class _Resposive_layoutState extends State<Resposive_layout> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  addData()async{
    UserProvider _userProvider  = Provider.of(context,listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints){
      if(Constraints.maxWidth > kWebScreenSize ){
         return widget.webScreenLayout;
      }
     else{
      return widget.mobileScreenLayout;
      }
     },
    );
   }
}
