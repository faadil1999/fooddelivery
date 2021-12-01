import 'package:flutter/material.dart';
import 'package:fooddelivery/colors_style.dart';

AppBar homeAppBar(BuildContext context){
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      splashRadius: 24.0,
      onPressed: (){
        print ('menu icon tappeer');
      },
      icon: Image.asset('image/appbar_menu_ic.png'),),
    actions: [
      IconButton(
        splashRadius: 24.0,
        onPressed: (){
          print("card icon on tap");
        },
        icon: Icon(Icons.shop),)
    ],
  );
}