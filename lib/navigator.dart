import 'dart:convert';

import 'package:diet_app/contacts.dart';
import 'package:flutter/material.dart';
//import 'package:dietapp/home.dart';
//import 'package:dietapp/login.dart';
//import 'package:dietapp/profile.dart';
import 'settings.dart';
import 'profile.dart';
import 'login.dart';
import 'home.dart';
//import 'package:dietapp/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:vuta_na_mkwanja/screens/orders.dart';
// import 'package:vuta_na_mkwanja/screens/profile.dart';

// import '../../screens/favorite.dart';
// import '../screens/profile.dart';
// import '../../screens/home.dart';

class NavigatorWidget extends StatefulWidget {
  const NavigatorWidget({Key? key}) : super(key: key);

  @override
  State<NavigatorWidget> createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {
  int _selectedindex = 0;
  var userData;

  @override
  void initState() {
    // checkLoginStatus();
    // _getUserInfo();

    //listenNotifications();
    super.initState();
  }

  checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    setState(() {
      userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> allpages = [
      HomeScreen(),
      // InputPage(),
      ContactScreen(),
      ProfileScreen(),
    ];

    void onItemtap(int index) {
      setState(() {
        _selectedindex = index;
      });
    }

    return Scaffold(
      body: allpages.elementAt(_selectedindex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Home",
                  
                ),
              ),
              label: '',
              icon: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                  )
                  // Image.asset(
                  //   'assets/images/001-home.png',
                  //   fit: BoxFit.contain,
                  //   width: 20,
                  // ),
                  )),
          // BottomNavigationBarItem(
          //     activeIcon: Padding(
          //       padding: const EdgeInsets.only(top: 25.0),
          //       child: Text(
          //         "BMI",
          //         // style: TextStyle(fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //     label: '',
          //     icon: Padding(
          //         padding: const EdgeInsets.only(top: 20),
          //         child: Icon(
          //           Icons.bubble_chart_outlined,
          //           color: Colors.black,
          //         )
          //         //  Image.asset(
          //         //   'assets/images/003-bookmark.png',
          //         //   fit: BoxFit.contain,
          //         //   width: 20,
          //         // ),
          //         )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Contact Us",
                  
                ),
              ),
              label: '',
              icon: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Icon(
                    Icons.contact_page_outlined,
                    color: Colors.black,
                  )
                  // Image.asset(
                  //   'assets/images/002-searching.png',
                  //   fit: BoxFit.contain,
                  //   width: 20,
                  // ),
                  )),

          
          
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Profile",
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              label: '',
              icon: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  )
                  //  Image.asset(
                  //   'assets/images/004-logout.png',
                  //   fit: BoxFit.contain,
                  //   width: 20,
                  // ),
                  )),
        ],
        currentIndex: _selectedindex,
        onTap: onItemtap,
      ),
    );
  }
}
