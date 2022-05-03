import 'package:flutter/material.dart';
import 'package:pocket_clone/src/ui/mylist.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MyList(),
      ),
    );
  }
}
