import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}




class _FeedbackScreenState extends State<FeedbackScreen> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController feedbaController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: true,
      title: const Text("Feedback"),
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

    body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      // validator: validateUsername,
                      // keyboardType: TextInputType.phone,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          // borderSide: BorderSide.none,
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        hintText: 'Full Name',
                        hintStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      maxLines: 7,
                      controller: feedbaController,
                      // validator: validatePassword,
                      // keyboardType: TextInputType.phone,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          // borderSide: BorderSide.none,
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        hintText: 'Feedback',
                        hintStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              MaterialButton(
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
                  //     builder: (context) => AdminDasboard(),
                  //   ),
                  // );
                  // _add_job_API();
                },
                child: const Text(
                  'Send Feedback',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              // const SizedBox(
              //   height: 200,
              // ),

              // _contentOverView(),
              // const SizedBox(
              //   height: 30,
              // ),

              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    
    );
  }
}
