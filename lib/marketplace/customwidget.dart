import 'package:flutter/material.dart';
import 'package:instashop/marketplace/category/category.dart';
import 'package:instashop/marketplace/category/categoryjson.dart';
import 'package:provider/provider.dart';


///
/// App bar class
///
class CustomAppBar extends PreferredSize {
  
 final double height;
 final String title;
 final IconData icon;
 final Color color;
 final Function callback;


  CustomAppBar({this.height = kToolbarHeight,this.title,this.icon,this.color,this.callback});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colors.pink[600],
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               GestureDetector(child: Icon(icon,color: color,),onTap: (){
                 callback();
               },),
              Text(
                '$title',
                softWrap: true,
                style: constant().style
              ),
              Icon(Icons.mail,color: Colors.white,), 
            ],
          ),
        ),
      ],
    ),
      ),
    );
  }
}

///
/// container
///
Widget customContainer(Widget child,Color color){
  return Container(child: child,decoration: BoxDecoration(borderRadius: BorderRadius.circular(0),color: color),
  constraints: BoxConstraints(
    maxHeight: double.infinity,));
}

Widget expandedcontainer(Widget child) {
return Container(
    constraints: BoxConstraints(
    maxHeight: double.infinity,
),
child: child,);
}


///
/// Text Overflow widget
///

Widget overflowtext(String title,TextStyle style){
 return Flexible(
  child: new Container(
    padding: new EdgeInsets.only(left: 50.0),
    child: new Text(
      '$title',
      overflow: TextOverflow.fade,
      style: style,
    ),
  ),
);
} 


///
/// Style
///

class constant{
 final TextStyle style = TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold);
 final TextStyle style1 = TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.normal);
 final TextStyle style2 =  TextStyle(
        fontSize: 15.0,
        fontFamily: 'Roboto',
        color: new Color(0xFF212121),
        fontWeight: FontWeight.bold,
      );
 
 final Color whitecolor = Colors.white;
 final Color pinkcolor = Colors.pink[600];


}

 customHeight(BuildContext context){
   final double height =  MediaQuery.of(context).size.height;
}

//
// new serach widget
//

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
     key,
     this.text,
     this.onChanged,
     this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 42,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: style.color),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}