import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/components/custom_tab.dart';
import 'package:fooddelivery/components/form_login.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  static const String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {


    return  Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 325.0,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                    color: Colors.white,
                    boxShadow: [ BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 0,
                      blurRadius: 30.0,
                      offset: const Offset(0 , 4),
                    )]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('image/head_login_screen.png',),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTab(
                              isSelected: selectedIndex ==0 ,
                              onTap: (){
                                onTapItem(0);
                              },
                              title: 'Login'),
                          CustomTab(
                              isSelected: selectedIndex == 1,
                              onTap: (){
                                onTapItem(1);
                              },
                              title: 'Sign-Up'),

                        ]
                    )
                  ],
                ),
              ),
               FormLogin(index: selectedIndex,)

            ],
          ),
        )
    );

  }

  void onTapItem(int i) {
    setState(() {
       selectedIndex = i;
    });
  }
}



