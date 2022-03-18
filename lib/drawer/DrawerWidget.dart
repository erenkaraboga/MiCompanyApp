
import 'package:aygun/model/DrawerModel.dart';
import 'package:flutter/material.dart';
class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;
  const DrawerWidget({Key? key, required this.onSelectedItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildDrawerItems(context)
        ],
      ),
    );
  }
 Widget buildDrawerItems(BuildContext context)=>Column(
     children: DrawerItems.all.map((e) => Card(
       margin: EdgeInsets.fromLTRB(10, 40, 140,0),
       color: Colors.white,
       elevation: 10,
       child: ListTile(
           trailing:Container(
             width: 8,
             height: 8,
             decoration: BoxDecoration(
               shape: BoxShape.circle,
               color: e.color,
             ),
           ),
           contentPadding: EdgeInsets.fromLTRB(10,20,40,20,),
           leading: Image.asset(e.imagePath),
           title:Text(e.descriptiion, style: TextStyle(fontSize: 15),) ,
           onTap: ()=>onSelectedItem(e)
       ),
     )).toList(),
 );

}
