import 'package:flutter/material.dart';
import 'package:fooddelivery/components/product_card.dart';
import 'package:fooddelivery/models/product_model.dart';
import 'package:fooddelivery/screens/details/product_details_screen.dart';

class ProductCarousel extends StatefulWidget {
  final int currentIndex;
  const ProductCarousel({Key key , this.currentIndex}) : super(key: key);

  @override
  _ProductCarouselState createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  PageController _pageController;
  int initPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: initPage , viewportFraction: 0.63);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.85,
      child: PageView.builder(
          itemCount: categories[widget.currentIndex].productList.length,
          itemBuilder: (context , index)=>GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailsScreen(product: categories[widget.currentIndex].productList[index]),
                  fullscreenDialog: true,
                 ));
              },
              child: ProductCard(product: categories[widget.currentIndex].productList[index]
            ,)
          ),
        controller: _pageController,
      ),
    );
  }
}
