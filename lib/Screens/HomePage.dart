import 'package:flutter/material.dart';
import 'package:flutter_login_ui/Screens/Gallery.dart';
import 'package:flutter_login_ui/Screens/HomeScreen.dart';
import 'package:flutter_login_ui/Screens/Person.dart';
import 'package:flutter_login_ui/Screens/loginScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final tabs = [
    HomeScreen(),
    Person(),
    Gallery(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
        backgroundColor: Colors.amber,
        title: Text('Flutter Design'),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber,
        fixedColor: Colors.white,
        elevation: 5.0,
        iconSize: 20.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Person"),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("API Data"),
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              accountEmail: Text(
                "au4098@gmail.com",
                style: TextStyle(color: Colors.black),
              ),
              accountName: Text(
                "Asad Ullah",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(""),
                  ),
                  ListTile(
                    title: Text(
                      "Home",
                      style: TextStyle(fontSize: 17.0),
                    ),
                    leading: Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Divider(
                    height: 20.0,
                    color: Colors.black,
                    thickness: 2.0,
                  ),
                  ListTile(
                    title: Text(
                      "Profile",
                      style: TextStyle(fontSize: 17.0),
                    ),
                    leading: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                  ),
                  Divider(
                    height: 20.0,
                    color: Colors.black,
                    thickness: 2.0,
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    title: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 17.0),
                    ),
                    leading: Icon(
                      Icons.pool_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Divider(
                    height: 20.0,
                    color: Colors.black,
                    thickness: 2.0,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      title: Text(
                        "Logout",
                        style: TextStyle(fontSize: 17.0),
                      ),
                      leading: Icon(
                        Icons.exit_to_app_outlined,
                        color: Colors.white,
                      ),
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
}
