import 'package:flutter/material.dart';
import 'package:instashop/marketplace/category/categoryproductmodel.dart';
import 'package:instashop/marketplace/customwidget.dart';

class cart extends StatefulWidget {
  List<Map<String,int>> productName = [];
  List<Map<int,List<Map<String,String>>>> productNamearray = [];
cart({this.productName,this.productNamearray});
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
 List<Map<String,int>> productNames = [];

  @override
  void initState() { 
    super.initState();

   print('====${widget.productNamearray.map((e) => print(e.keys)).toList()}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Instashop',color: constant().whitecolor,height: 100,icon: Icons.arrow_back,callback:(){
        Navigator.pop(context);
      },),
      body: ListView.builder(
        itemCount: widget.productNamearray.length,
        itemBuilder: (BuildContext context, int index) {
        
//        widget.productNamearray.map((e) => {
// e.forEach((key, value) {
//  value.forEach((element) {
//    print(element);
//  });
// })


//        }).toList();
        return expandedcontainer(
          ListTile(
           //  title: Text(widget.productNamearray[index].m),
            // subtitle: Text('Quantity : ${widget.productName[index].values.toString()}'),
            trailing: Column(
              children: [
                Text("data"),
                Text("data")
              ],
            ),
          )
        );
         
       },
      ),
    );
  }
}