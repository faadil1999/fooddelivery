import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget{

  @required final TextEditingController nameController ;
  @required final bool isPassword;
  @required final String lable ;
  @required final TextInputType keyboardType ;

  const CustomTextField({ Key key, this.nameController, this.isPassword:false , this.lable, this.keyboardType:TextInputType.text}):super (key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      decoration: InputDecoration(labelText: lable),
      controller: nameController,
      obscureText: isPassword ? true : false,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: 17.0),
      validator: (value){
          if(value.isEmpty){
              return 'This case is empty';
          }
      },


    );
  }
}