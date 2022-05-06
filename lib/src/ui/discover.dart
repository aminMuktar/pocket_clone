import 'package:flutter/material.dart';
class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
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
    );
  }
}
