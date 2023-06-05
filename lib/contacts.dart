
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatefulWidget {
  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Contact Us'),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomListTile2(
                "Email",
                Icons.mail,
                Icons.keyboard_arrow_right_outlined,
              ),
              CustomListTile2(
                "Phone Contact",
                Icons.phone,
                Icons.keyboard_arrow_right_outlined,
              ),
              CustomListTile2(
                "Facebook",
                Icons.facebook,
                Icons.keyboard_arrow_right_outlined,
              ),
              
              CustomListTile2(
                "Twitter",
                FontAwesomeIcons.twitter,
                Icons.keyboard_arrow_right_outlined,
              ),

              CustomListTile2(
                "Instagram",
                FontAwesomeIcons.instagram,
                Icons.keyboard_arrow_right_outlined,
              ),
              CustomListTile2(
                "Location",
                FontAwesomeIcons.locationArrow,
                Icons.keyboard_arrow_right_outlined,
              ),
              // SwitchListTile(
              //   value: _darkMode,
              //   title: Text(
              //     ' Night Mode',
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              //   secondary: Padding(
              //     padding: const EdgeInsets.all(9.0),
              //     child: Icon(Icons.dark_mode),
              //   ),
              //   onChanged: (newValue) {
              //     setState(() {
              //       _darkMode = newValue;
              //     });
              //   },
              //   // visualDensity: VisualDensity.adaptivePlatformDensity,
              //   // switchType: SwitchType.material,
              //   activeColor: Colors.indigo,
              // ),
              
              // Padding(
              //   padding: EdgeInsets.only(left: 20, top: 15, bottom: 14),
              //   child: Text(
              //     "Support",
              //     style:
              //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //   ),
              // ),
              // CustomListTile(
              //   "Help",
              //   Icons.space_bar_rounded,
              //   Icons.keyboard_arrow_right_outlined,
              // ),
              // CustomListTile(
              //   "About us",
              //   Icons.person_outline,
              //   Icons.keyboard_arrow_right_outlined,
              // ),
              // CustomListTile(
              //   "Contact us",
              //   Icons.message,
              //   Icons.keyboard_arrow_right_outlined,
              // ),
              const SizedBox(height: 20),
              
              // SizedBox(height: 30.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {},
              //       child: Text(
              //         "Follow",
              //         style: TextStyle(fontSize: 18.0),
              //       ),
              //       style: ElevatedButton.styleFrom(
              //         fixedSize: Size(140.0, 55.0),
              //         primary: Colors.green,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(15.0),
              //         ),
              //       ),
              //     ),
              //     SizedBox(width: 15.0),
              //     OutlinedButton(
              //       onPressed: () {},
              //       child: Icon(Icons.mail_outline_outlined),
              //       style: OutlinedButton.styleFrom(
              //           primary: Colors.black,
              //           backgroundColor: Colors.black12,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(50.0),
              //           ),
              //           fixedSize: Size(50.0, 60.0)),
              //     )
              //   ],
              // ),
              // SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    
    );
  }
}

class CustomListTile2 extends StatelessWidget {
  String title;
  IconData icon;
  IconData traling;

  CustomListTile2(this.title, this.icon, this.traling, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListTile(
        tileColor: Colors.grey.shade50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: (Icon(
            icon,
            size: 25,
          )),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          traling,
          size: 22,
        ),
      ),
    );
  }
}
