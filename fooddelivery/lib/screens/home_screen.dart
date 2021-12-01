import 'package:flutter/material.dart';
import 'package:fooddelivery/colors_style.dart';
import 'package:fooddelivery/components/body_home.dart';
import 'package:fooddelivery/components/cart_product_user.dart';
import 'package:fooddelivery/components/profil_user.dart';
import 'package:fooddelivery/models/product_model.dart';

import 'home/app_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home";
  static List<ProductModel> basket_product = [];
  static List<ProductModel> favorit_product = [];
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<ProductModel> basket_product = HomeScreen.basket_product;
  int _currentIndex = 0 ;

  List<Widget> tabs = [
     Container(
        child:BodyHome() ,),
    Center(
      child: Container(
        child:Text("Favorite") ,)
      ,
    ),
    Center(
      child: Container(
        child:ProfilUser() ,
      )
      ,
    ),
    Center(
   child:CartProductUser(products: basket_product,)),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.colorHomeBg,
      appBar: homeAppBar(context),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double>animation){
          return ScaleTransition(
            scale:animation,
            child: child,
          );
        },
        child: tabs[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: _currentIndex,
        iconSize: 31.0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home , color: BrandColors.colorGrey,),
          label: 'Home' , activeIcon: Icon(Icons.home , color: BrandColors.colorPrimary,)),

          BottomNavigationBarItem(icon: Icon(Icons.favorite , color: BrandColors.colorGrey,),
              label: 'Favorite' , activeIcon: Icon(Icons.favorite , color: BrandColors.colorPrimary,)),

          BottomNavigationBarItem(icon: Icon(Icons.person , color: BrandColors.colorGrey,),
              label: 'Profil' , activeIcon: Icon(Icons.person , color: BrandColors.colorPrimary,)),


          basket_product.length == 0 ? BottomNavigationBarItem(
              icon: Icon( Icons.shopping_basket_outlined  , color: BrandColors.colorGrey,),
              label: 'Panier', activeIcon: Icon(Icons.shopping_basket , color: BrandColors.colorPrimary,),

          ): BottomNavigationBarItem(
            icon: new Stack(
              children: <Widget>[
                new Icon(Icons.shopping_basket),
                new Positioned(
                  right: 0,
                  child: new Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 15,
                      minHeight: 15,
                    ),
                    child: new Text(
                      '${basket_product.length}',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            label: 'Notifications',
          ),
          ],
        onTap: (index){
        setState(() {
          _currentIndex = index;
        });

        },
        selectedItemColor: BrandColors.colorPrimary,
    )
      ,);
  }
}
