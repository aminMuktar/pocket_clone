import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({Key? key}) : super(key: key);
  Widget _backButton(){
    return InkWell(
      onTap: (){

      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 50, 0, 0),

              child: Icon(
                Icons.close,
                color: Colors.black,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Wrap(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Column(
              children:<Widget>[
                _backButton()
              ],
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            child: Image(
              image: AssetImage(
                "images/noconnection.jpg",
              ),
            ),
          )
        ],
      ),

    );
  }
}
