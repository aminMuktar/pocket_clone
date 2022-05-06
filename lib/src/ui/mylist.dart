import 'package:flutter/material.dart';
// import 'dart:math' as math;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  var popUpMenuItemsList = <String>[
    'Bulk Edit',
    'Refresh',
    'Settings',
    'Help',
    'Listen (TTS)'
  ];

  Widget emptyList() {
    return Center();
  }

  void onSelect(item) {
    switch (item) {
      case 'Bulk Edit':
        print('Bulk Edit clicked');
        break;

      case 'Refresh':
        print('Refresh clicked');
        break;
      case 'Settings':
        print('Settings clicked');
        break;
      case 'Help':
        print('Help clicked');
        break;
      case 'Listen (TTS)':
        print('Listen (TTS) clicked');
        break;
    }
  }

  Widget bodyField() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "Search your list",
                    style: TextStyle(
                      color: Color(0xff808080),
                    ),
                  ),
                ),
              ),
              IconButton(
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
                                    'Newest saved',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold,),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    'Oldest saved',
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
                ),
              ),
              // body card
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Container(
                height: 200,
                child: Stack(
                  children: <Widget>[
                    ListTile(
                      title: Text("Hello world"),
                      subtitle: Text("Hello world"),
                    ),
                    Positioned(
                        right: 0,
                        top: 0,
                        child: Image(
                          image: AssetImage("images/book1.png"),
                          width: 150,
                          height: 100,
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(MdiIcons.playCircleOutline),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(MdiIcons.dotsVertical),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
          child: Container(
            color: Colors.white60,
            height: 1,
          ),
          preferredSize: Size.fromHeight(1),
        ),
        title: const Text(
          "My List",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(MdiIcons.headphones)),
          IconButton(
              onPressed: () {}, icon: const Icon(MdiIcons.diamondOutline)),
          PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return popUpMenuItemsList.map((String choice) {
                  return PopupMenuItem<String>(
                    child: Text(choice),
                    value: choice,
                  );
                }).toList();
              },
              onSelected: onSelect)
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: bodyField(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.menuOpen,
              size: 30,
            ),
            label: "My List",
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
              MdiIcons.bellOutline,
              size: 30,
            ),
            label: "Activity",
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
