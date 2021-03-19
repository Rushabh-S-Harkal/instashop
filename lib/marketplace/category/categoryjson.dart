import 'package:flutter/material.dart';
import 'package:instashop/marketplace/category/category.dart';

class categorys{
  int id;
  String categoryname;
  String categoryimageurl;
  Map<String, int> subcatecogries;
  subcategories sub;
  List<subcategories> subcategorylist;
  categorys({this.id,this.categoryname,this.categoryimageurl,this.subcatecogries,this.sub,this.subcategorylist});
}

List<categorys> categorylist = [
  // 0th node
categorys(
id:0,
categoryimageurl: 'assets/images/grocery.webp',
categoryname: 'Grocery',
subcatecogries:{"sauce": 1, "Jam": 2,},
subcategorylist: [
subcategories(id: 0,subcategorydescription: 'sauce 415gr',subcategoryid: 0,subcategoryname: 'Lea & Perrins Worcestershire Sauce',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/grocery0.jpeg'),
subcategories(id: 0,subcategorydescription: 'Jam 454gr',subcategoryid: 1,subcategoryname: 'M&S Strawberry Jam',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/grocery1.jpeg')
]
),
 // 1st node
categorys(
id:1,
categoryimageurl: 'assets/images/pharmacy.webp',
categoryname: 'Pharmacy',
subcatecogries:{"Mouthwash": 1, "Dettol": 2,},
subcategorylist: [
subcategories(id: 1,subcategorydescription: 'Mouthwash',subcategoryid: 2,subcategoryname: 'Listerine Cool Mint Antiseptic Mouthwash',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/pharm0.jpeg'),
subcategories(id: 1,subcategorydescription: 'Dettol',subcategoryid: 3,subcategoryname: 'Dettol Antibacterial Wet Wipes Original Scent - alcohol free',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/pharm1.jpeg')]
),

//2nd node
categorys(
id:2,
categoryimageurl: 'assets/images/bakery.webp',
categoryname: 'Bakery',
subcatecogries:{"Chocolate": 1, "Bread": 2,},
subcategorylist: [
subcategories(id: 2,subcategorydescription: 'Chocolate',subcategoryid: 4,subcategoryname: 'Chocolate Croissant',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/bakery0.jpeg'),
subcategories(id: 2,subcategorydescription: 'Bread',subcategoryid: 5,subcategoryname: 'Soft Sesame Bread',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/bakery1.jpeg')]
),

//3rd node

categorys(
id:3,
categoryimageurl: 'assets/images/cakesAndDesserts.webp',
categoryname: 'Cake And Desserts',
subcatecogries:{"Cake": 1, "Dessert": 2,},
subcategorylist: [
subcategories(id: 3,subcategorydescription: 'Cheesecake',subcategoryid: 6,subcategoryname: 'Strawberry Cheesecake',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/cake0.jpeg'),
subcategories(id: 3,subcategorydescription: 'Dessert',subcategoryid: 7,subcategoryname: 'Dessert Bundle',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/cake1.jpeg')]

//4th node

),
categorys(
id:4,
categoryimageurl: 'assets/images/coffeeCapsMachines.webp',
categoryname: 'Tea corner',
subcatecogries:{"Black Tea": 1, "Green Tea": 2,},
subcategorylist: [
subcategories(id: 4,subcategorydescription: 'Black Tea',subcategoryid: 8,subcategoryname: 'Black Dragon Tea',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/tea0.jpeg'),
subcategories(id: 4,subcategorydescription: 'Green Tea',subcategoryid: 9,subcategoryname: 'Extra Battery Green Tea',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/tea1.jpeg')]

//5th node

),
categorys(
id:5,
categoryimageurl: 'assets/images/food.webp',
categoryname: 'Food',
subcatecogries:{"Veg": 1, "NonVeg": 2,},
subcategorylist: [
subcategories(id: 5,subcategorydescription: 'Bowl',subcategoryid: 10,subcategoryname: 'Vegetarian Chika Bowl',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/food0.jpeg'),
subcategories(id: 5,subcategorydescription: 'Tiger Prawns',subcategoryid: 11,subcategoryname: 'Frozen Royal Mediterranean Tiger Prawns (U6/8)',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/food1.jpeg')]

),
categorys(
id:6,
categoryimageurl: 'assets/images/fruitsAndVegetables.webp',
categoryname: 'Fruits and Vegetables',
subcatecogries:{"Mangoes": 1, "Apples": 2,},
subcategorylist: [
subcategories(id: 6,subcategorydescription: 'Mangoes',subcategoryid: 12,subcategoryname: 'Mangoes Alphonso',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/fruits0.jpeg'),
subcategories(id: 6,subcategorydescription: 'Apples',subcategoryid: 13,subcategoryname: 'Apples Golden France Packet',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/fruit1.jpeg')]

),
categorys(
id:7,
categoryimageurl: 'assets/images/petshop.webp',
categoryname: 'Pet Shop',
subcatecogries:{"Pet food": 1, "Anti-Diarrhea Pet Solution": 2,},
subcategorylist: [
subcategories(id: 7,subcategorydescription: 'Good Boy Dog Treats',subcategoryid: 14,subcategoryname: 'Good Boy Dog Treats Chicken Bites with 50% Natural Chicken Breast Meat',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/pet0.jpeg'),
subcategories(id: 7,subcategorydescription: 'Naturvet Anti-Diarrhea Pet Solution',subcategoryid: 15,subcategoryname: 'Naturvet Anti-Diarrhea Pet Solution with Kaolin',subcategoryprice: 'AED 6',subcategoryimageurl: 'assets/images/pet1.jpeg')]

),
];
 


class subcategories{
int id;
int subcategoryid;
String subcategoryname;
String subcategoryimageurl;
String subcategoryprice;
String subcategorydescription;

subcategories({this.id,this.subcategoryid,this.subcategorydescription,this.subcategoryimageurl,this.subcategoryname,this.subcategoryprice});

// List<subcategories> subcategorylist = [

// ];
}