import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {

  final List numbers = List.generate(30, (index) => "Item $index");
  var popUpMenuItemsList = <String>[
    'Bulk Edit',
    'Refresh',
    'Settings',
    'Help',
    'Listen (TTS)'
  ];
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
  Widget discoverBody(){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.topLeft,
          child: Text(
            "Editor's picks",
            style: TextStyle(
              fontSize: 24,

            ),
          ),
        ),
        Container(

          padding: EdgeInsets.only(left:20,bottom: 30,right: 20),
          alignment: Alignment.center,
          child: Card(
            elevation: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image(
                  fit: BoxFit.fill,
                  image: AssetImage(
                  "images/book1.png",
                  ),
                ),
                Column(
                  children:<Widget>[
                  ListTile(
                    title: Container(
                      padding:EdgeInsets.all(20),
                        child: Text('The warehousenext door')
                    ),
                    subtitle: Text('Booming warehouse growth clashes with rural life in california\'s inland empire'),
                    ),
                  Row(

                    children: <Widget>[
                      TextButton.icon(
                          onPressed: (){},
                          icon: Icon(
                                Icons.save_outlined,
                            color: Colors.white,
                            size: 26,
                            ),
                        label: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                      SizedBox(
                        width:20 ,
                      ),
                      TextButton.icon(
                        onPressed: (){},
                        icon: Icon(
                          Icons.search_outlined,
                          color: Colors.white,
                          size: 26,
                        ),
                        label: Text(
                          'See similar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                      Expanded(
                        child: PopupMenuButton<String>(
                            itemBuilder: (BuildContext context) {
                              return popUpMenuItemsList.map((String choice) {
                                return PopupMenuItem<String>(
                                  child: Text(choice),
                                  value: choice,
                                );
                              }).toList();
                            },
                            onSelected: onSelect
                        ),
                      )

                    ],
                  ),

                  ],
                ),

              ],
            ),
          ),
        ),

      ],
    );
  }
  Widget gridCategory(){
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child:Container(
                  padding: EdgeInsets.only(left:20,bottom: 30,right: 20),
                    child: Column(
                      children: [
                        Image.asset('images/book1.png'),
                        ListTile(
                          title: Text("Main Title"),
                          subtitle: Text("author"),
                        ),


                      ],
                    )
                ),
              ),
              Expanded(
                child:Container(
                    padding: EdgeInsets.only(left:20,bottom: 30,right: 20),
                    child: Column(
                      children: [
                        Image.asset('images/book1.png'),
                        ListTile(
                          title: Text("Main Title"),
                          subtitle: Text("author"),
                        ),
                      ],
                    )
                ),
              ),
          ]

          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child:Container(
                      padding: EdgeInsets.only(left:20,bottom: 30,right: 20),
                      child: Column(
                        children: [
                          Image.asset('images/book1.png'),
                          ListTile(
                            title: Text("Main Title"),
                            subtitle: Text("author"),
                          ),
                        ],
                      )
                  ),
                ),
                Expanded(
                  child:Container(
                      padding: EdgeInsets.only(left:20,bottom: 30,right: 20),
                      child: Column(
                        children: [
                          Image.asset('images/book1.png'),
                          ListTile(
                            title: Text("Main Title"),
                            subtitle: Text("author"),
                          ),


                        ],
                      )
                  ),
                ),
              ]

          ),
        ],
      );
  }
  Widget categoryList(){
    return DefaultTabController(
        length: 13,
        initialIndex: 1,
        child: TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          tabs: <Widget>[
            Tab(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(left: 30,right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white60,
                      width: 1
                    )
                  ),
                    child: Text("Web")
                ),
            ),
            Tab(
                  child: Container(
                    alignment: Alignment.center,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.only(left:30,right: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.white60,
                            width: 1
                        )
                      ),
                      child: Text("Android")
                  ),
            ),
            Tab(
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(left: 30,right: 30),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white60,
                      width: 1
                    )
                  ),
                  child: Text("Iphone")
              ),
            ),
            Tab(
              child: Container(
                  alignment: Alignment.center,
                margin: EdgeInsets.all(5),

                  padding: EdgeInsets.only(left: 30,right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white60,
                      width: 1
                    )
                  ),
                  child: Text("DevOps"),
              ),
            ),
            Tab(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 30,right: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: Colors.white60,
                      width: 1
                  ),
                ),
                child: Text("Infosec"),
              ),
            ),
            Tab(
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(left: 30,right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        color: Colors.white60,
                        width: 1
                    ),
                  ),
                  child: Text("AI")),
            ),
            Tab(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 30,right: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: Colors.white60,
                      width: 1
                  ),
                ),
                  child: Text("Cloud"),
              ),
            ),
            Tab(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 30,right: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: Colors.white60,
                      width: 1
                  ),
                ),
                  child: Text("Operating system"),
              ),
            ),
            Tab(
              child: Container(
                  alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(left: 30,right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        color: Colors.white60,
                        width: 1
                    ),
                  ),
                  child: Text("Blockchain"),
              ),
            ),
            Tab(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 30,right: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: Colors.white60,
                      width: 1
                  ),
                ),
                  child: Text("Robotics"),
              ),
            ),

            Tab(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 30,right: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: Colors.white60,
                      width: 1
                  ),
                ),
                  child: Text("VR & AR"),
              ),
            ),
            Tab(
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(left: 30,right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        color: Colors.white60,
                        width: 1
                    ),
                  ),
                  child: Text("5G")
              ),
            ),
            Tab(
              child: Container(
                  alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(left: 30,right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        color: Colors.white60,
                        width: 1
                    ),
                  ),
                  child: Text("IoT"),
              ),
            ),

          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom:PreferredSize(
          child: Container(
            color: Colors.white60,
            height: 0.5,
          ),
          preferredSize: Size.fromHeight(0.5),
        ),
        title: const Text(
          'Discover',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal
        ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            categoryList(),
            discoverBody(),
            gridCategory()
          ],
        ),
      ),
    );
  }
}
