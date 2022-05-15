import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int activeIndex=0;
  final List<String> imageList=[
    'images/book1.png',
    'images/book2.png',
    'images/book3.png'
  ];
  final List<String> carouselTitle=[
    'Save what really interests you',
    'Make the most of any moment',
    'Your quiet corner of the internet'
  ];
  final List<String> carouselDesc=[
    'Collect aritcles,videos or any online content you like. Settle in with them anytime, on any phone, tablet or browser',
    'Save from Chrome,Twitter, Youtube or your favorite news app(for starters). Your articles and videos will be ready for you in Pocket',
    'Pocket saves articles in a clean layout designed for reading-no interruptions, no popups-so you can sidestep the internet\'s noise'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              imageCarousel(),
              SizedBox(
                height: 30.0,
              ),
              TextButton(

                onPressed: () {

                  },
                child: Text("Sign up",
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                ) ,),
                style: TextButton.styleFrom(

                  padding: const EdgeInsets.only(bottom:15,top: 15,left: 130,right: 130),
                  backgroundColor: Color(0xff0d5ee0),
                  shadowColor: Color(0xff031b42),
                ),
              ),
          SizedBox(height: 10,),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Color(0xff0d5ee0)),
                ),
                onPressed: () { },
                child: Text('Log in',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget imageCarousel(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
              options: CarouselOptions(
                height: 400,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                autoPlay: false,
                onPageChanged: (index,reason)=>
                  setState(() => activeIndex=index),

              ),
              items:imageList.map(
                      (e) => SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(e,
                              width:450,
                              height: 200,
                              fit:BoxFit.contain,
                              ),
                            SizedBox(height: 16,),
                            if(e=='images/book1.png')
                              Column(
                                children: <Widget>[
                                  Text(
                                    "${carouselTitle[0]}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                  ),

                                  Container(
                                    padding: EdgeInsets.all(40),
                                    child: Text(
                                      "${carouselDesc[0]}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )

                                ],
                              ),
                            SizedBox(
                              height: 10,
                            ),
                            if(e=='images/book2.png')
                              Column(
                                children: <Widget>[
                                  Text(
                                    "${carouselTitle[1]}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),

                                  Container(
                                    padding: EdgeInsets.all(40),
                                    child: Text(
                                      "${carouselDesc[1]}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )

                                ],
                              ),
                            SizedBox(
                              height: 10,
                            ),

                            if(e=='images/book3.png')
                              Column(
                                children: <Widget>[
                                  Text(
                                    "${carouselTitle[2]}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),

                                  Container(
                                    padding: EdgeInsets.all(40),
                                    child: Text(
                                      "${carouselDesc[2]}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ) ,

                      )).toList(),

        ),
        SizedBox(height: 10,),
        buildIndicator()
      ],
    );
  }

  Widget buildIndicator()=> AnimatedSmoothIndicator(
      activeIndex: activeIndex,
    count: imageList.length,
    effect: SwapEffect(
      paintStyle:  PaintingStyle.stroke,
      dotWidth:  10.0,
      dotHeight:  10.0,
      strokeWidth:  1.5,
      dotColor:  Colors.grey,
      activeDotColor:  Color(0xff0d5ee0) ,
    )
  );

}








