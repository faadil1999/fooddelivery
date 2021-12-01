
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/colors_style.dart';

class ProfilUser extends StatefulWidget {
  const ProfilUser({Key key}) : super(key: key);

  @override
  _ProfilUserState createState() => _ProfilUserState();
}

class _ProfilUserState extends State<ProfilUser> {

  Padding elementProfil (String label , String data){
    return Padding(padding: EdgeInsets.all(15),
      child:  Row(
        children: [
          Text("$label  :" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15 ),),
          SizedBox(width: 10.0,),
          Text("$data" ,style: TextStyle(fontSize: 15),)
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.0 , right: 15.0 , bottom: 30 ,top: 0),
            child:Container(
              height: 150.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: BrandColors.colorPrimary,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0) )
              ),
              child:Padding(
                padding: EdgeInsets.only(left: 20 ,top: 10),
                child:  Text("Information \nutilisateur" ,
                  style: TextStyle(color:BrandColors.colorBodyBg , fontSize:30.0 , fontWeight: FontWeight.bold, ), ),

              ) ) ,
          ),
          SizedBox(height: 3,),
          Padding(
            padding:EdgeInsets.only(left: 15.0 , right: 15.0 , top: 15.0 ,bottom: 00)  ,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: BrandColors.colorBodyBg
              ),
              child: Column(
                children: [
                  elementProfil("Nom", "Torou"),
                  elementProfil("Prenom", "Faadil"),
                  elementProfil("Adresse", "Abomey Calavi"),
                  elementProfil("Téléphone", "+229 90902812"),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0 , vertical: 8.0),
                    width: double.infinity,
                    child:  OutlinedButton(onPressed: (){

                      print('On tap button Add to Card');
                    },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text('Modifier'),
                          SizedBox(width: 10,),
                          Icon(Icons.edit)
                        ],),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

  }


}
