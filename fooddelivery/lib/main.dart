import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/screens/home_screen.dart';
import 'package:fooddelivery/screens/login_screen.dart';
import 'package:fooddelivery/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_style.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food delivery',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor: BrandColors.colorPrimary,
            textStyle: const TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
        ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),

          )
        )),
        primaryColor: Colors.blue,
      ),
      routes: {
        SplashScreen.id:(context)=>SplashScreen(),
        LoginScreen.id :(context)=> LoginScreen(),
        HomeScreen.id :(context)=>HomeScreen()
      },
        initialRoute: HomeScreen.id,
    );
  }
}
