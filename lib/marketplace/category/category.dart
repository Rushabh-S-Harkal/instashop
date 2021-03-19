import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instashop/marketplace/category/categoryDetails.dart';
import 'package:instashop/marketplace/category/categoryjson.dart';
import 'package:instashop/marketplace/customwidget.dart';
import 'package:provider/provider.dart';

class category extends StatefulWidget {
  @override
  _categoryState createState() => _categoryState();
}

class _categoryState extends State<category> {


List<categorys> books;
String query = '';


@override
void initState() { 
  super.initState();
  books = categorylist;
}
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
          SearchWidget(hintText: 'Search by category name',onChanged: searchBook,text: 'Hey ',),
        Expanded(
          child: new StaggeredGridView.countBuilder(
            scrollDirection: Axis.vertical,
  crossAxisCount: 4,
  shrinkWrap: false,
  itemCount: books.length,
  itemBuilder: (BuildContext context, int index) {

return  InkWell(
  onTap: (){
  //  print("filteredcategory ${Provider.of<_searchBarState>(context).}");
           Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => categorydetail(categoryproductlist: [books[index]],))
  );
  },
  child: Column(
          children: [
          
            Expanded(
              child: new Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.transparent,image: DecorationImage(image:ExactAssetImage(books[index].categoryimageurl) ,fit: BoxFit.cover)),
                   child:  Stack(
                     children: [
                  
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.pink[100].withOpacity(0.7),
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        child:Center(child: Text(books[index].categoryname,style: constant().style2,)),
                      ),
                    )
                     ],
                   )
              
                 ),
            ),
          ],
  ),
);
  },
  staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 3 : 2),
  mainAxisSpacing: 4.0,
  crossAxisSpacing: 4.0,
),
        ),
      ],
    );
  }
  void searchBook(String query) {
    final books = categorylist.where((book) {
      final titleLower = book.categoryname.toLowerCase();
     // final authorLower = book.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ;
      //||authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.books = books;
    });
  }
}


