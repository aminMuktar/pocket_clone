import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}
class _MyListState extends State<MyList> {
  Widget searchField(){
    return Row(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: TextField(
              onTap: (){},
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Search your list"
              ),
            ),
          ),

        IconButton(
            onPressed: (){},
            icon:Icon(MdiIcons.menu),

        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.black,
        title: Text(
          "My List",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: (){},
              icon: Icon(MdiIcons.headphones)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(MdiIcons.diamond)
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(MdiIcons.dotsVertical)
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
              child:searchField(),
          ),
        ],
      ),
    );
  }
}
