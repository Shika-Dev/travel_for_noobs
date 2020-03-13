import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_for_noobs/screen/welcomePage.dart';
import 'package:travel_for_noobs/tabs/searchtab.dart';
import 'package:travel_for_noobs/tabs/foodtab.dart';
import 'package:travel_for_noobs/tabs/stories.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
  title: "Travel Guide",
  home: Welcome(),
  debugShowCheckedModeBanner: false,

));

class TabsApp extends StatefulWidget{
  @override
  createState() => TabsState();
}

class TabsState extends State<TabsApp>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  TabBarView getTabBarView( var tabs){
    return TabBarView(
      controller: tabController,
      children: tabs,
    );
  }

  TabBar getTabBar(){
    return TabBar(
      tabs: <Widget>[
        Tab(
          icon: Icon(
            Icons.search,
            size: 30.0,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.local_pizza,
            size: 30.0,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.book,
            size: 30.0,
          ),
        ),
        /*Tab(
          icon: CircleAvatar(
            radius: 15.0,
            backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
          ),
        )*/
      ],
      controller: tabController,
      unselectedLabelColor: Color(0xFFD8ECF1),
      labelColor: Color(0xFF3EBACE),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: getTabBarView(<Widget>[
        searchtab(), foodtab(), storiestab(),
      ]),
      bottomNavigationBar: getTabBar(),
    );
  }
}