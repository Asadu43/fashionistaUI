import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_my_text/animated_text.dart';
import 'package:animate_my_text/animated_text_package.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250.0,
                  width: double.infinity,
                  color: Colors.amber,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: AnimatedText(
                        text: "Hello Fashionista " ,
                        textStyle: GoogleFonts.handlee(
                            fontSize: 30.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                        durationBetweenLetters: Duration(milliseconds: 70),
                        letterExpandingDuration: Duration(milliseconds: 500),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: AnimatedText(
                       text: 'What do you want to buy? ',
                        textStyle: GoogleFonts.handlee(
                            fontSize: 30.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                        durationBetweenLetters: Duration(milliseconds: 40),
                        letterExpandingDuration: Duration(milliseconds: 1100),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(5.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.amber,
                              size: 30.0,
                            ),
                            contentPadding:
                            EdgeInsets.only(left: 15.0, top: 10.0),
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Stack(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Material(
                  elevation: 1.0,
                  child: Container(height: 75.0, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 75.0,
                      width: MediaQuery.of(context).size.width / 4,
                      child: Column(
                        children: [
                          Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/dress.jpg"),
                              ),
                            ),
                          ),
                          Text(
                            'Dress',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 75.0,
                      width: MediaQuery.of(context).size.width / 4,
                      child: Column(
                        children: [
                          Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/shoes.png"),
                              ),
                            ),
                          ),
                          Text(
                            'Shoes',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 75.0,
                      width: MediaQuery.of(context).size.width / 4,
                      child: Column(
                        children: [
                          Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/watch.jpg"),
                              ),
                            ),
                          ),
                          Text(
                            'Watch',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 75.0,
                      width: MediaQuery.of(context).size.width / 4,
                      child: Column(
                        children: [
                          Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/bag.jpg"),
                              ),
                            ),
                          ),
                          Text(
                            'Bags',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            itemCard("Special Frok", 'assets/frok.jpg', false),
            itemCard("Flexible Shoes", 'assets/shoess.jpg', true),
            itemCard("Antique Watch", 'assets/watchone.jpg', false),
            itemCard("Brand Bags", 'assets/bags.png', true),
            itemCard("Slim Watch", "assets/watchtwo.jpg", false)
          ],
        ),
      ],
    );

  }

  Widget itemCard(String title, String imgPath, bool isFav) {
    return Container(
      height: 170.0,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            height: 150.0,
            width: 140.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 60.0,
                  ),
                  Material(
                    elevation: isFav ? 0.0 : 2.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: isFav
                            ? Colors.grey.withOpacity(0.2)
                            : Colors.white,
                      ),
                      child: Center(
                        child: isFav
                            ? Icon(Icons.favorite_border)
                            : Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                child: Text(
                  "The members seek to provide \n comprehensive and specialist as \n auctioneers  of antiques, ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    height: 40.0,
                    width: 100.0,
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        '\$248',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40.0,
                    width: 100.0,
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        'Add To Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
