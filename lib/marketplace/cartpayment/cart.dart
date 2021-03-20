import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instashop/marketplace/category/categoryproductmodel.dart';
import 'package:instashop/marketplace/customwidget.dart';

class cart extends StatefulWidget {

  List<Map<String,Map>> cartproductName = [];
cart({this.cartproductName});
  @override
  _cartState createState() => _cartState();
}
List productNames = [];
class _cartState extends State<cart> {
 

  @override
  void initState() { 
    super.initState();
// print(json.encode(widget.cartproductName.toString()));


print("object : ${widget.cartproductName.length}");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Instashop',color: constant().whitecolor,height: 80,icon: Icons.arrow_back,callback:(){
        Navigator.pop(context);
      },),
      body: ListView.builder(
        itemCount: widget.cartproductName.length,
        itemBuilder: (BuildContext context, int index) {
     
       return expandedcontainer(

          ListTile(
             title: Column(
               children: [
                 Row(
                   children: [
                     Container(child: Text(widget.cartproductName[index].values.first.values.toString()),width: 200,),
                 
                   ],
                 ),
               ],
             ),
            
          )
       );
         
       },
      ),
    );
  }
}