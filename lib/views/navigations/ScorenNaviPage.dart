import 'package:aygun/views/devices/scorenPage.dart';
import 'package:flutter/material.dart';
class ScorenNaviPage extends StatefulWidget {
  const ScorenNaviPage({Key? key, }) : super(key: key);
  @override
  State<ScorenNaviPage> createState() => _ScorenNaviPageState();
}
class _ScorenNaviPageState extends State<ScorenNaviPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.grey.shade300,
          bottom: const TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.grey,
            tabs: [
              Tab(text: 'HSM 90K'),
              Tab(text: 'Drill',),
              Tab(text: 'Shawer',),
            ],
          ),
          title: Text("Scoren"),
        ),
        body: TabBarView(
          children: [
             ScorenPage(color: Colors.green,colorShade: Colors.green.shade300,name: "HSM 90K"),
             ScorenPage(color: Colors.red,colorShade: Colors.red.shade300,name:"Drill"),
             ScorenPage(color: Colors.blue,colorShade: Colors.blue.shade300,name: "Shaver",),
          ],
        ),
      ),
    );
  }
}