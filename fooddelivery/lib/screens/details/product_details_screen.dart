import 'package:flutter/material.dart';
import 'package:fooddelivery/colors_style.dart';
import 'package:fooddelivery/models/product_model.dart';
import 'package:fooddelivery/screens/home_screen.dart';
import 'package:path/path.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product ;
  const ProductDetailsScreen({Key key, this.product}) : super(key: key);


  @override
  Widget build(BuildContext context) {

  verification(ProductModel productModel){
      bool verify = false;
      if(HomeScreen.basket_product.length > 0){
        for(int i = 0 ; i < HomeScreen.basket_product.length ; i++ ){
          if(productModel == HomeScreen.basket_product[i]){
            verify = true;

          }
        }
      }
      return verify;
    }

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

    return Scaffold(
      body: SafeArea (
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0 , vertical: 12.0 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: ()=>Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        )),
                    verificationFavorite(product)== false ?
                    IconButton(
                        onPressed: (){
                          print("Added to favorit!!");
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Ajouté a aux Favoris"))
                          );
                          HomeScreen.favorit_product.add(product);
                          Navigator.pop(context);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        )
                    ):
                    IconButton(
                        onPressed: (){
                          HomeScreen.favorit_product.remove(product);

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Retiré des Favoris"))
                          );
                          Navigator.pop(context);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                          print("retrived to favorit!!");
                            },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                    )
                  ],
                ),
              ),

              ImageBloc(product:product),
              SizedBox(height: 44.0,),
              Text(product.title , style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.w600),),
              SizedBox(height: 10.0,),
              Text(
                "${product.prix} CFA",
                 style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  color: BrandColors.colorPrimary
                ),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 32.0 , vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( 'Delivery Info' ,
                          style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold ,),
                        ),
                        SizedBox(height: 8.0,),
                        Text('Delivered between monday aug and thursday 20 from 8pm to 12:00 pm' ,
                          style: TextStyle(fontSize: 15 ,),
                        ),
                        SizedBox(height: 45.0,),
                        Text('Return Policy' ,
                          style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold ,),
                        ),
                        SizedBox(height: 8.0,),
                        Text('All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately' ,
                          style: TextStyle(fontSize: 15 ,),
                        ),
                      ],
                    ),
                    )
                  ],
                ),
              ),
             verification(product) == false ? Container(
               padding: EdgeInsets.symmetric(horizontal: 30.0 , vertical: 8.0),
               width: double.infinity,
               child:  OutlinedButton(onPressed: (){
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                 HomeScreen.basket_product.add(product) ;
                 print('added');
               },
                 child: Padding(
                   padding: const EdgeInsets.symmetric(vertical: 24.0),
                   child:Text('Add to cart'),
                 ),
               ),
             ):Container(
               padding: EdgeInsets.symmetric(horizontal: 30.0 , vertical: 8.0),
               width: double.infinity,
               child:  OutlinedButton(onPressed: (){

                 print('added');
               },
                 style: ButtonStyle(backgroundColor:  MaterialStateProperty.all(Colors.white),),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(vertical: 24.0),
                   child:Text('Deja au panier' , style: TextStyle(color: Colors.grey),),
                 ),
               ),
             ),
              SizedBox(height: 15.0,)
            ],
          ),
        ),
      ),
    );
  }
}


class ImageBloc extends StatefulWidget {
  final ProductModel product;
  const ImageBloc({Key key, this.product}) : super(key: key);

  @override
  _ImageBlocState createState() => _ImageBlocState();
}

class _ImageBlocState extends State<ImageBloc> {
  int currentPage = 0;

  Widget updateIndicators(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.product.imageList.map((item) {
        var index = widget.product.imageList.indexOf(item);
        return Container(
          height: 8.0,
          width: 8.0,
          margin: EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index? BrandColors.colorPrimary: Color(0xFFC4C4C4),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250.0,
          width: double.infinity,
          child: PageView.builder(
              itemCount: widget.product.imageList.length,
              itemBuilder: (context, index){
            return Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height:242.0 ,
                  child: Image.asset(widget.product.imageList[index] ,fit: BoxFit.fitHeight,),
                ),
            );
          },
          controller: PageController(initialPage: currentPage),
          onPageChanged: (index){
                setState(() {
                  currentPage = index;
                });
          },
          ),
        ),
        updateIndicators(),

      ],
    );
  }
}
