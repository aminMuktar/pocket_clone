import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';



class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
            Image(
                image: AssetImage('images/pocket.png'),
                height:30,
              width: 30,

            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "pocket",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.blueGrey,
                  ),
            ),

          ],
      ),
        ],
      ),
    );
  }

}








