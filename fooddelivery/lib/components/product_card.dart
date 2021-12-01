import 'package:flutter/material.dart';
import 'package:fooddelivery/models/product_model.dart';
import 'package:fooddelivery/screens/home_screen.dart';


import '../colors_style.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product ;
  const ProductCard({Key key, this.product}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    verificationFavorite(ProductModel productModel){
      bool verify = false;
      if(HomeScreen.favorit_product.length > 0){
        for(int i = 0 ; i < HomeScreen.favorit_product.length ; i++ ){

          if(productModel == HomeScreen.favorit_product[i]){
            verify = true;
          }

        }
      }
      return verify;
    }

    return Padding(
      padding: EdgeInsets.only(top:18.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40.0),
            width: 220.0,
            height: 270.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
                boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 10,
                    blurRadius: 30,
                    offset: Offset(0,1)
                )]
            ),
          ),
          Container(
            width: 220.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 165,
                  width: 165.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(332),
                      boxShadow: [
                        BoxShadow(
                          color:Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0 , 1),
                        )
                      ]
                  ),
                  child: Image.asset(product.imagePath),
                ),
              SizedBox(height: 30,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(product.title ,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis ,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),

                Row(
                  mainAxisAlignment: verificationFavorite(product) == true ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                  children: [
                    Text("${product.prix} CFA",
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: BrandColors.colorPrimary
                      ),),
                    verificationFavorite(product) == true ?Icon(Icons.favorite , color: Colors.red,)
                        :SizedBox(height: 0,)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
