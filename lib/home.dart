//import 'package:dietapp/diet_detail.dart';
//import 'package:dietapp/help.dart';

//import 'package:dietapp/login.dart';
import 'package:diet_app/complains.dart';
import 'package:diet_app/repot.dart';

import 'login.dart';
import 'help.dart';
import 'diet_detail.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  _logoutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Logout'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: const Text(
                    "Are you sure you want to logout",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                          onTap: () async {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            await preferences.clear();
                            Navigator.of(context).pop();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: const Text('Yes')),

                      const SizedBox(
                        width: 30,
                      ),

                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('No')),
                      // onPressed: () {
                      //   Navigator.of(context).pop();
                      // }
                    ])
              ],
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: const Text("Diet App"),
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
      elevation: 0,
      actions: <Widget>[
      PopupMenuButton<int>(
          onSelected: (item) => onSelected(context, item),
          icon: const Icon(
            Icons.more_vert,
            // color: Colors.black,
          ),
          itemBuilder: (context) => const [
                PopupMenuItem(
                  value: 0,
                  child: Text(
                    'Help',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text(
                    'Complains',
                    style: TextStyle(fontSize: 14),
                  ),
                ),

                PopupMenuItem(
                  value: 3,
                  child: Text(
                    'Report',
                    style: TextStyle(fontSize: 14),
                  ),
                ),

                PopupMenuItem(
                  value: 4,
                  child: Text(
                    'Logout',
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ])
      ],
    ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
        
              Center(
                child: Image.asset(
                  'assets/diet.png',
                  width: 200, // set the desired width
                  height: 200, // set the desired height
                ),
              ),
        
              SizedBox(
                height: 20,
              ),
        
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MaterialButton(
                  elevation: 0,
                  color: Colors.orange,
                  height: 50,
                  minWidth: 500,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {
                    // _submit();
                    // _login();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DietDetailScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Get Diet',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
        
             
            ],
          ),
        ),
      ),
    );
  }

  onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        // _join_Group_Dialog(context);
        // createAlertDialog_ChoosePDF(context);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HelpScreen()));
        break;

      case 1:
      Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HelpScreen()));
        break;
       

      case 2:

        // createAlertDialog_ChoosePDF(context);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ComplainScreen()));
        break;

      case 3:
        // _logoutDialog(context);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ReportScreen()));
        break;

      case 4:
       _logoutDialog(context);
      // _logoutDialog(context);
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => ClassRoom_Page()));
      break;

      default:
    }
  }
}