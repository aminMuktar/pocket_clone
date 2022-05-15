import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List <String> books=['images/book1.png','images/book2.png','images/book3.png'];
  List <String> title=['you are miracle patter maker patter maker patter maker','patter maker','pa/per cra'];
  List <String> author=['google.com','qoura.com','securityweek.com'];
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.all(20),
            height: 200,
            child: ListView.builder(
              itemCount: books.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 25,right: 6),
                itemBuilder:(context,index){
                  return Container(
                    margin: EdgeInsets.only(right: 20),
                    height: 210,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage(books[index]),
                      )
                    ),
                  );
                }
            ),
          ),
        ListView.builder(
          padding: EdgeInsets.only(top: 25,right: 25,left: 25),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: books.length,
            itemBuilder:(context,index){
              return GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height:120 ,
                  width: MediaQuery.of(context).size.width-50,
                  color: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: AssetImage(books[index])
                          )
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            title[index],
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            maxLines: 2,
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),
                          ),
                          SizedBox(height:5),
                          Text(
                              author[index],
                            style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue
                            ),
                          ),
                        ],
                        ),
                      ),

                    ],

                  ),
                ),
              );
            }
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Text(
            "Top Stories",
            style: GoogleFonts.openSans(
              fontSize: 20,

            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.all(20),
          height: 210,
          child: ListView.builder(
              itemCount: books.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 25,right: 6),
              itemBuilder:(context,index){
                return Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 210,
                  width: 153,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage(books[index]),
                      )
                  ),
                );
              }
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          height: 50,
          child: ListView.builder(
              itemCount: books.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 25,right: 6),
              itemBuilder:(context,index){
                return Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage(books[index]),
                      )
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
}
