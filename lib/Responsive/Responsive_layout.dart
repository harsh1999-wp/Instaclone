import 'package:flutter/material.dart';
import '../components/dimensionals.dart';

class Resposive_layout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  Resposive_layout({required this.webScreenLayout,required this.mobileScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints){
      if(Constraints.maxWidth > kWebScreenSize ){
         return webScreenLayout;
      }
     else{
      return mobileScreenLayout;
      }
     },
    );
   }
}
