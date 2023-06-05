import 'package:flutter/material.dart';

class DietDetailScreen extends StatefulWidget {
  @override
  State<DietDetailScreen> createState() => _DietDetailScreenState();
}

class _DietDetailScreenState extends State<DietDetailScreen> {
  String? chosenStatus, chooseAlarm;
  List<String>? foodList = [];

  setDiets() {
    if (chosenStatus == "Morning (Breakfast)") {
      setState(() {
        foodList = ['miogo', 'chapati', 'mandazi'];
      });
    } else if (chosenStatus == "After Noon (Lunch)") {
      setState(() {
        foodList = ['wali', 'chips', 'ndizi'];
      });
    } else if (chosenStatus == "Evenging") {
      setState(() {
        foodList = ['bugger', 'pizza', 'kisinia'];
      });
    } else if (chosenStatus == "Night (Dinner") {
      setState(() {
        foodList = ['mboga mboga', 'ndizi', 'chapati'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("Diet Detail"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          // actions: [
          //   PopupMenuButton<String>(
          //     onSelected: (String value) {
          //       // Handle menu item selection
          //     },
          //     itemBuilder: (BuildContext context) {
          //       return <PopupMenuEntry<String>>[
          //         PopupMenuItem<String>(
          //           value: 'Option 1',
          //           child: Text('Option 1'),
          //         ),
          //         PopupMenuItem<String>(
          //           value: 'Option 2',
          //           child: Text('Option 2'),
          //         ),
          //         PopupMenuItem<String>(
          //           value: 'Option 3',
          //           child: Text('Option 3'),
          //         ),
          //       ];
          //     },
          //   ),
          // ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  // padding: const EdgeInsets.all(0.0),
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 0, bottom: 0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)),
                  child: DropdownButton<String>(
                    value: chosenStatus,
                    //elevation: 5,
                    // style: TextStyle(color: Colors.black),

                    hint: Text('Select Time'),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(color: Colors.black, fontSize: 15),

                    items: <String>[
                      'Morning (Breakfast)',
                      'After Noon (Lunch)',
                      'Evenging',
                      'Night (Dinner)'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),

                    onChanged: (String? value) {
                      print(value);
                      // var v = '0';
                      // if (value == 'Revenue') {
                      //   v = '1';
                      // }
                      setState(() {
                        chosenStatus = value;
                        // _visible_tag = v;
                      });
                    },
                  ),
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => DietDetailScreen(),
                    //   ),
                    // );
                    setDiets();
                  },
                  child: const Text(
                    'Get Food Details',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Center(
                child: Image.asset(
                  'assets/diet.png',
                  width: 100, // set the desired width
                  height: 100, // set the desired height
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  // padding: const EdgeInsets.all(0.0),
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 0, bottom: 0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)),
                  child: DropdownButton<String>(
                    value: chooseAlarm,
                    //elevation: 5,
                    // style: TextStyle(color: Colors.black),

                    hint: Text('Get Food'),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(color: Colors.black, fontSize: 15),

                    items:
                        foodList!.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),

                    onChanged: (String? value) {
                      print(value);
                      // var v = '0';
                      // if (value == 'Revenue') {
                      //   v = '1';
                      // }
                      setState(() {
                        chooseAlarm = value;
                        // _visible_tag = v;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
