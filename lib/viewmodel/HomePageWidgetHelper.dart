import 'package:flutter/material.dart';
InputDecoration textFieldDecoration(String hintText){
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    prefixIcon: Icon(Icons.account_box_rounded,
      color:Colors.white70
      ,),
    filled: true,
    fillColor: Colors.black54,
    hintText: hintText,
    hintStyle: TextStyle(
      color:Colors.white70

    ),

  );
}
//TextStyle Decoration
TextStyle simpleTextStyle(){
  return TextStyle(
    color: Colors.black54,
  );
}
//Background Decoration
BoxDecoration decoration(){
  return BoxDecoration(
      image: DecorationImage(
          image: AssetImage("lib/img/foto.jpg"),
          fit: BoxFit.cover
      )
  );
}
TextStyle mediumTextStyle(){
  return TextStyle(
      color: Colors.white54,
      fontSize: 17
  );
}
InputDecoration textFieldDecoration2(String hintText) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    prefixIcon: Icon(Icons.lock,
      color: Colors.white70
      ,),
    filled: true,
    fillColor: Colors.black54,
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.white70

    ),

  );
}
InputDecoration textFieldDecoration3(String hintText) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    prefixIcon: Icon(Icons.account_circle_sharp,
      color: Colors.grey
      ,),
    filled: true,
    fillColor: Colors.black54,
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.white70

    ),
  );}
