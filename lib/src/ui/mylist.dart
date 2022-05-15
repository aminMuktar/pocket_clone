import 'package:flutter/material.dart';
// import 'dart:math' as math;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pocket_clone/src/ui/discover.dart';
import 'package:pocket_clone/src/ui/home.dart';
import 'package:pocket_clone/src/ui/profile.dart';
import 'package:pocket_clone/src/ui/search.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> with SingleTickerProviderStateMixin {
  int _currentIndex=0;
  final List<Widget> _bottomNavigationBarRoute=[
    Home(),
    Discover(),
    Search(),
    Profile()
  ];
  void onTappedBar(int index){
    setState(() {
      _currentIndex=index;
    });
  }
  Widget appBarWidgets(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        IconButton(
          iconSize: 60,
          onPressed: () {
            showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 250,
                    child: Center(
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            onTap:(){},
                            title: Text(
                              'Newest',
                              style:
                              TextStyle(fontWeight: FontWeight.bold,),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Oldest',
                              style:
                              TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Shortest to read',
                              style:
                              TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Longest to read',
                              style:
                              TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          icon: const Icon(
            Icons.sort,
            size: 30.0,
            color: Colors.white,
          ),
        ),
        // body card
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        actions:[
          appBarWidgets(),
        ]
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              child:Column(
                children:<Widget>[
                  _bottomNavigationBarRoute[_currentIndex],
                ],
        )

            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        elevation: 5,
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xff0d5ee0),
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            ),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_outlined,
              size: 30,
            ),
            label: "Discover",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
              size: 30,
            ),
            label: "Profile",
          ),

          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.account,
              size: 30,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
