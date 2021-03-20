import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:instashop/flavour.dart';
import 'package:instashop/marketplace/category/category.dart';
import 'package:instashop/marketplace/category/categoryjson.dart';
import 'package:instashop/marketplace/customwidget.dart';
import 'package:instashop/marketplace/location/userlocation.dart';
import 'package:geocoder/geocoder.dart';
import 'package:provider/provider.dart';
import 'package:instashop/flavour.dart';
var userAddress;
var coordinates;

class Marketplace extends StatefulWidget {
  Marketplace({Key key}) : super(key: key);
  @override
  _MarketplaceState createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
//search variables
 final globalKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();
  List<dynamic> _list;
  bool _isSearching;
  String _searchText = "";
  List searchresult = new List();



_MarketplaceState(){
   _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _controller.text;
        });
      }
    });
}
  
//end

@override
void initState() { 
  super.initState();
   _isSearching = false;
getUserLocation();
}


void getUserLocation() async{

determinePosition().then((value) async => {
  print("object$value"),
   coordinates = new Coordinates(value.latitude, value.longitude),
  await Geocoder.local.findAddressesFromCoordinates(coordinates).then((value) => {
   print(value.first.addressLine),
   setState((){
userAddress = value.first.addressLine;
   })
  }), 
});
}

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
    resizeToAvoidBottomInset: false,
  appBar: CustomAppBar(
    height: 70,
    title: Provider.of<flavour>(context).toString()//'Instashop',   
   // child: SearchWidget(hintText: 'Enter Text',onChanged:null,text: 'hi',),  
  ),

///
///Body starts
///


body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
      child:   Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
 
  Container( 
    child: Flexible(
     // flex: 1,
      child: customContainer( 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Icon(Icons.pin_drop,color: constant().whitecolor,),
            ),
            //Address text
            userAddress == null? CircularProgressIndicator(backgroundColor: constant().whitecolor,):
       overflowtext(userAddress?? 'Loading...',constant().style1),
          //Set address button
            TextButton(onPressed: (){}, child:  Text('Set',style: constant().style1,))
          ],
      ),
      Colors.pinkAccent),
    ),
  ),
 //SizedBox(height: 10,),

SingleChildScrollView(
  physics: ClampingScrollPhysics(),
child: Container(
  height: MediaQuery.of(context).size.height-120,
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Expanded(child: Container(color: Colors.transparent ,child: category(),))
  ],),
),
)

    //SingleChildScrollView
// 
],
        ),
      ),
    ),
);
}

  // void searchBook(String query) {
  //   final books = categorylist.where((book) {
  //     final titleLower = book.categoryname.toLowerCase();
  //    // final authorLower = book.author.toLowerCase();
  //     final searchLower = query.toLowerCase();

  //     return titleLower.contains(searchLower) 
  //     //||    authorLower.contains(searchLower);
  //   }).toList();

  //   setState(() {
  //     this.query = query;
  //     this.books = books;
  //   });
  // }
}

