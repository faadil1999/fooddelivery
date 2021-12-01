import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProductModel{
  final String title;
  final String imagePath;
  final int prix ;
  final List<String>imageList;
  int quantity;


  ProductModel( {this.title, this.imagePath, this.prix , this.imageList  , this.quantity});
}

class Category {
  final String title;
  List<ProductModel> productList ;

  Category({this.title, this.productList});

}

List<Category> categories = [
  Category(title: 'Pastels' , productList:[
    ProductModel(
        title:"Pastels au poisson haché",
        imagePath:'image/foods1.png',
        prix:1500,
        imageList: [
          'image/foods1.png',
          'image/foods2.png'
        ],
      quantity: 1
    ),
    ProductModel(title:"Pastels à la viande hachée",
        imagePath:'image/foods2.png',
        prix:2000,
        imageList: [
          'image/foods1.png',
          'image/foods2.png'
        ],
        quantity: 1
    ),

    ProductModel(title:"Pastels au thon",
        imagePath:'image/foods2.png',
        prix:1500,
        imageList: [
          'image/foods1.png',
          'image/foods2.png'
        ],
        quantity: 1
    ),
    ProductModel(title:"Pastels au corn beef",
        imagePath:'image/foods2.png',
        prix:1500,
        imageList: [
          'image/foods1.png',
          'image/foods2.png'
        ],
        quantity: 1
    ),

    ProductModel(title:"Pastels au poulet et à la mozarella",
        imagePath:'image/foods2.png',
        prix:2000,
        imageList: [
          'image/foods1.png',
          'image/foods2.png'
        ],
        quantity: 1
    ),
    ProductModel(title:"Pastels à la viande hachée et à la mozarella",
        imagePath:'image/foods2.png',
        prix:2000,
        imageList: [
          'image/foods1.png',
          'image/foods2.png'
        ],
        quantity: 1
    ),

  ]),
  Category(title: 'Crêpes' , productList:[
    ProductModel(
        title:"Simple sucrée",
        imagePath:'image/foods2.png',
        prix:1000,
        imageList: [
          'image/foods1.png',
          'image/foods2.png'
        ],
        quantity: 1
    ),
    ProductModel(
        title:"Sucrée au chocolat",
        imagePath:'image/foods2.png',
        prix:1500,
        imageList: [
          'image/foods1.png',
          'image/foods2.png'
        ],
        quantity: 1
    ),
    ProductModel(
        title:"Sucrée a la confiture",
        imagePath:'image/foods2.png',
        prix:1500,
        imageList: [
          'image/foods1.png',
          'image/foods2.png'
        ],
        quantity: 1
    ),
    ProductModel(
        title:"Salées au jambon et a la mozarella",
        imagePath:'image/foods2.png',
        prix:2000,
        imageList: [
          'image/foods1.png',
          'image/foods2.png'
        ],
        quantity: 1
    )
  ]),
  Category(title: 'Drinks' , productList:[
    ProductModel(
        title:"Yaourt simple",
        imagePath:'image/foods2.png',
        prix:500,
        imageList: [
          'image/foods1.png',
          'image/foods2.png'
        ],
        quantity: 1
    ),
    ProductModel(
        title:"Yaourt aux fruits",
        imagePath:'image/foods2.png',
        prix:800,
        imageList: [
          'image/foods1.png',
          'image/foods2.png'
        ],
        quantity: 1
    ),
    ProductModel(
        title:"Jus nature",
        imagePath:'image/foods2.png',
        prix:500,
        imageList: [
          'image/foods1.png',
          'image/foods2.png'
        ],
        quantity: 1
    ),
  ]),
  Category(title: 'Pizza' , productList:[
    ProductModel(
        title:"Mini pizza x10",
        imagePath:'image/foods2.png',
        prix:2500,
        imageList: [
          'image/foods1.png',
          'image/foods2.png'
        ],
        quantity: 1
    ),
    ProductModel(
        title:"Cakes",
        imagePath:'image/foods2.png',
        prix:2500,
        imageList: [
          'image/foods1.png',
          'image/foods2.png'
        ],
        quantity: 1
    ),
  ]),
];