import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/components/custom_textfield.dart';
import 'package:fooddelivery/managment_database/authentification_service.dart';
import 'package:fooddelivery/managment_database/database_manager.dart';

import '../colors_style.dart';


class FormLogin extends StatefulWidget {
 @required final int index;
 FormLogin({this.index});
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
 var phoneController = TextEditingController();
 var userNameController = TextEditingController();
 var passwordController = TextEditingController();


 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(

        child:   Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.index == 1 ?Column(
                  children: [
                    CustomTextField(lable: 'Your name ', nameController: userNameController,),
                    const SizedBox(height: 12.0,),
                    CustomTextField(lable: 'Your Phone ', isPassword: false , nameController: phoneController,),
                    const SizedBox(height: 12.0,),
                  ],
                ):const SizedBox(),
                CustomTextField(lable: 'Email adress ', nameController: emailController,),
                const SizedBox(height: 12.0,),
                CustomTextField(lable: 'Password ', isPassword: true , nameController: passwordController,),
                const SizedBox(height: 12.0,),
                widget.index == 1 ? SizedBox():

                Text('Forgot passcode?',
                  style: TextStyle(
                      color: BrandColors.colorPrimary,
                      fontSize: 17.0 ,
                      fontWeight: FontWeight.w500  ), ),

                SizedBox(height: 20,),
                Center(
                  child:   Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0 , vertical: 5.0),
                    width: 300,
                    child:  OutlinedButton(onPressed: (){
                      if (formKey.currentState.validate()) {

                        widget.index==1 ? AuthentificationService().createNewUser(emailController.text, passwordController.text, userNameController.text, phoneController.text)
                            : AuthentificationService().signInWithEmailAndPassword(emailController.text, passwordController.text);
                        // Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => Home(uid: this.uid )), (route) => false);
                      }
                      widget.index == 1 ? print('It is for registration!!!!') : print(" It is for login !!!!");
                    },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child:Text('Confirm'),
                      ), ),
                  ),
                ),
                SizedBox(height: 20,),


              ],
            ),
            ),

          ],
        ),

      ),
    );
  }
}
//FormLogin(index: selectedIndex,)