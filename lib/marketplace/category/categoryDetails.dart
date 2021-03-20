



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instashop/marketplace/cartpayment/cart.dart';
import 'package:instashop/marketplace/category/categoryjson.dart';
import 'package:instashop/marketplace/category/categoryproductmodel.dart';
import 'package:instashop/marketplace/customwidget.dart';

class categorydetail extends StatefulWidget {
  @override
  List<categorys> categoryproductlist = [];
  categorydetail({this.categoryproductlist});
  _categorydetailState createState() => _categorydetailState();
}

List categoryproductlists = [];

productmodel model = productmodel();


class _categorydetailState extends State<categorydetail> {
    List<int> _counter = []; 
    List<Map<String,int>> productName = [];

List<Map<String,Map>> cartproductName = [];

var cartitempair = {
'name':'',
'qty':'',
'price':''
};

Map<String, dynamic> cartInfo = {
};
@override
void initState() { 
  super.initState();
  categoryproductlists.clear();
  
//widget.categoryproductlist.map((e) => print(e.subcategorylist.map((e) => print(e)).toList())).toList();

// print('detail view :${widget.categoryproductlist.map((e) => print(e.subcategorylist))}');
widget.categoryproductlist.map((e) => {
  e.subcategorylist.map((e) => {
  print(e.subcategoryname),
  model = productmodel(id: e.id,imageurl: e.subcategoryimageurl,name: e.subcategoryname,price: e.subcategoryprice,productid: e.subcategoryid),
 categoryproductlists.add(model),
  }).toList()
}).toList();
print('length${categoryproductlists.last}');
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(onPressed: () { print(_counter.toString() );
      print("cartInfo are $productName");
      print('cartproductName after $cartproductName');
    

         Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => cart(cartproductName: cartproductName,))
  );
       },
      child: Text('Proceed'),),
        appBar: CustomAppBar(
        icon: Icons.arrow_back,
        color: Colors.white,
        callback: (){
          Navigator.pop(context);
        },
    height: 80,
    title: 'Instashop',
  ),


body: GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  itemBuilder: (BuildContext context, index) {
    if(_counter.length < categoryproductlists.length){
      _counter.add(0);
    }
 model = categoryproductlists[index];
if(productName.length == categoryproductlists.length){
  print("objectpresent");
}else{
  productName.add({model.name:0});
  cartproductName.add({model.productid.toString():cartitempair});
   print("objectnotpresent");
}


print('cartproductName $cartproductName');
 

return InkWell(child: Stack(
  children: [
        Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
       
        color: Colors.amber,
        child: Column(
          children: [
           
             Expanded(
               flex: 2,
              child: Container(
                color: Colors.white,
               height: MediaQuery.of(context).size.height,
               width: MediaQuery.of(context).size.width,
                child:  Image.asset(
        model.imageurl, fit: BoxFit.contain,),
              ),
            ),
             Expanded(
              flex: 1,
              child: Container(
                color: Colors.pink[600],
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                  Stack(
                    children: [
                      Container(
        width: 185,
        child: ListTile(
          title: Text(
          model.name,style: constant().style1,overflow: TextOverflow.clip,
          ),
          leading: Stack(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Image.asset('assets/images/price-tags.png',color:Colors.white54)
              ,
               Positioned(child: Text(model.price,style: constant().style1,),top: 20,left: 10,),
            ],
          ),
          
   
        ),
    ),
                    ],
                  ),
                 
                  ],
                ),
              ),
            ),
              
         
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    ),
    Positioned(
      child:  _counter[index] == 0? Container(): Container(
        child: Center(child: _counter[index] == 0? Container():Text(_counter[index].toString() ,style: constant().style1,)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),color: Colors.pink[600],)
          ,height: 30,
          width: 30,
          ),top: 20,left: 30,),


  Positioned(
      child:  _counter[index] == 0? Container(): Container(
        child: _counter[index] == 0? Container():IconButton(icon: Image.asset("assets/images/minus.png",color: Colors.white,), onPressed: (){
 
 model = categoryproductlists[index];
 setState(() {
   _counter[index] == 0? Container()
 :     _counter[index]--;
 productName[index].update(model.name, (value) => _counter[index]);


  });
        }),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),color: Colors.pink[600],)
          ,height: 30,
          width: 30,
          ),top: 20,left: 150,),



  ],
),onTap: (){
  model = categoryproductlists[index];
   setState(() {
                          _counter[index]++;
                    

if(productName.length == categoryproductlists.length){
  print("objectpresent");
  productName[index].update(model.name, (value) => _counter[index]);
  // cartproductName.add({model.productid:cartitempair});

var items = {
  'name':"${model.name}",
  'qty':_counter[index],
  'price':model.price.toString()
};


  cartproductName[index].update(model.productid.toString(), (value) => items);


 
  
  //  cartproductName[index].update(model.productid, (value) => {'qty':_counter[index]});
  //   cartproductName[index].update(model.productid, (value) => {'price':model.price});
}else{
 // productName.add({model.name:0});
   print("objectnotpresent");

}

                            });
           //   print(index);
},);
  },
  itemCount: categoryproductlists.length,
),


    );
  }
}