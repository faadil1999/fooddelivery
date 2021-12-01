import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/models/product_model.dart';
import 'package:fooddelivery/screens/confirm_order_screen.dart';

import '../colors_style.dart';

class CartProductUser extends StatefulWidget {
 final List<ProductModel>products ;
  const CartProductUser({Key key, this.products}) : super(key: key);

  @override
  _CartProductUserState createState() => _CartProductUserState(this.products);
}

class _CartProductUserState extends State<CartProductUser> {
  List<ProductModel>products ;
  _CartProductUserState(this.products);
  int price = 0;
  String the_order = "";
  @override
  void initState() {
    super.initState();
    initialPrice();

  }
  void initialPrice(){
    if(products.isNotEmpty){
      for(int i = 0 ; i < products.length ; i++){
        price += products[i].prix * products[i].quantity;
      }
    }
    else{
      price = 0;
    }
  }

  void saveOrder(){
    for(int i = 0 ; i < products.length ; i++){
      the_order += "${products[i].title}  ${products[i].prix} x ${products[i].quantity} \n";
    }
    the_order += "Le total est de : $price";
  }

  @override
  Widget build(BuildContext context) {
     return Column(
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
                             InkWell(
                               onTap: (){
                                 int quantity = products[index].quantity;
                                 setState(() {
                                   if(products[index].quantity >= 1){
                                     products[index].quantity --;
                                     price -= products[index].prix ;
                                     if(products[index].quantity == 0){
                                     products.remove(products[index]);
                                   }
                                   }
                                   else if(products[index].quantity < 1 ){
                                     price -= products[index].prix;
                                     products.remove(products[index]);
                                   }
                                 });
                                 quantity--;
                               },
                               child: Icon(Icons.remove),
                             ),
                             Text("${products[index].quantity}"),
                             InkWell(
                               onTap: (){
                                 int quantity = products[index].quantity;
                                 setState(() {
                                   products[index].quantity ++;
                                   price += products[index].prix ;
                                 });
                                 quantity++;
                               },
                               child: Icon(Icons.add),
                             )
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
                       color: BrandColors.colorBodyBg,
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),
                           topRight: Radius.circular(20.0) )
                   ),
                   child:Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                  Expanded(
                    child: Padding(
                         padding: EdgeInsets.only(left: 25 ,top: 10),
                         child:  Text("Le total est de :                 $price CFA" ,
                           style: TextStyle(color:BrandColors.colorPrimary , fontSize:20.0 , fontWeight: FontWeight.bold, ), ),

                       )
                  ),
                      products.length != 0 ? ElevatedButton(
                         onPressed: () {
                           setState(() {
                             saveOrder();
                           });
                           
                           print(the_order);
                           print("Cest confirmer");
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmOrder(products: this.products, total_price: price,)));
                         },
                         child: Icon(Icons.shopping_basket_outlined ,size: 35.0,),
                         style: ElevatedButton.styleFrom(
                           primary: BrandColors.colorPrimary,
                           shape: CircleBorder(),
                           padding: EdgeInsets.all(10),
                         ),
                       ): SizedBox(width: 0,)
                     ],
                   )

                 )
               )

       ],
     )
    ;
  }
}
