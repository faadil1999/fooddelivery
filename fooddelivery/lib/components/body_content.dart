import 'package:flutter/material.dart';
import 'package:fooddelivery/components/product_caroussel.dart';
import 'package:fooddelivery/models/product_model.dart';

import '../colors_style.dart';


class BodyContent extends StatefulWidget {
  const BodyContent({Key key}) : super(key: key);

  @override
  _BodyContentState createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  int selectedCategory = 0;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 60.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal ,
                itemCount: categories.length,
                itemBuilder: (context ,index) => builItem(context ,index)),
          ),
          ProductCarousel(currentIndex:selectedCategory),

        ],
      ),
    );
  }

  Widget builItem(BuildContext context , int index){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: GestureDetector(
          onTap: (){
            setState(() {
              selectedCategory = index;
            });
          },
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(categories[index].title,
                style: TextStyle(
                  fontSize: 17.0,
                  color: index == selectedCategory ? BrandColors.colorPrimary:BrandColors.colorGrey,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.0),
                height: 3.0,
                width: 87.0,
                decoration: BoxDecoration(
                  color: index == selectedCategory ? BrandColors.colorPrimary:Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ],
          ) ,
        )
    );
  }
}


