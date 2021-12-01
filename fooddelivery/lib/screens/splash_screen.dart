import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors_style.dart';
import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
static  const String id = 'splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  var _visible = true;
 AnimationController animationController ;
 Animation<double> animation;

  startTime() {
  var _duration  = Duration(seconds: 3);
  return Timer(_duration, navigationPage);
  }

  void navigationPage(){
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.id , (route) => false
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this , duration: Duration(seconds: 2),);
    animation = CurvedAnimation(parent: animationController , curve: Curves.easeOut);
    animation.addListener(()=>this.setState(() {}),);
    animationController.forward();

    setState( (){
      _visible = !_visible;
    });

    startTime();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image:DecorationImage(image: AssetImage('image/flash_screen_bg.png'),
                fit: BoxFit.cover)
        ),
        child:Center(
          child: Container(
              height: 262.0,
              width: 262.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(131.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Image.asset('image/bella_logo.png'),
                  Text("Food For Everyone" , style: TextStyle(
                    color: BrandColors.colorPrimary,
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 20.0,),
                  CircularProgressIndicator(
                    strokeWidth: 2.0,
                  )
                ],
            ),
          ),
        ) ,
      ),
    );
  }


}

