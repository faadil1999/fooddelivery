import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/models/product_model.dart';

import '../colors_style.dart';

class ConfirmOrder extends StatefulWidget {
  final List<ProductModel>products ;
  final int total_price;
  const ConfirmOrder({Key key, this.products, this.total_price}) : super(key: key);

  @override
  _ConfirmOrderState createState() => _ConfirmOrderState(this.products , this.total_price);
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  List<ProductModel>products ;
  int total_price ;

  _ConfirmOrderState(this.products ,this.total_price );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.colorPrimary,
        title: Text("Confirmation de commande"),
      ),
      body: Column(
        children: [
          Expanded(child: products.length >=1 ? ListView.builder(
              itemCount: this.products.length,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    Padding(padding: EdgeInsets.all(10),
                      child: Container(
                          height: 120.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    width: 200,
                                    child: Text("${products[index].title}" ,overflow: TextOverflow.ellipsis),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text("${products[index].prix}"),
                                  )
                                ],
                              ),
                              Container(
                                height: 100,
                                width: 120.0,
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
                                child: Image.asset(products[index].imagePath),
                              ),
                              Text(" X ${products[index].quantity}" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),)
                            ],

                          )
                      ),
                    )
                  ],
                );
              })
              :Container(
            child: Text("Le panier est vide tchoo"),
          )
          ),
          Padding(
              padding: EdgeInsets.only(left: 0.0 , right: 0.0 , bottom: 0 ,top: 10),
              child: Container(
                  height: 80.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: BrandColors.colorHomeBg,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0) )
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 25 ,top: 10),
                            child:  Text("Le total est de :                 $total_price CFA" ,
                              style: TextStyle(color:BrandColors.colorPrimary , fontSize:20.0 , fontWeight: FontWeight.bold, ), ),

                          )
                      ),

                    ],
                  )

              )
          ),
          ElevatedButton(
            onPressed: () {

              print("Cest confirmer");

            },
            child: Text("Confirmer Commmande"),
            style: ElevatedButton.styleFrom(
              primary: BrandColors.colorPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(10),
            ),
          )

        ],
      )
    );
  }
}
