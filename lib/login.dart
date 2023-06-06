import 'dart:convert';

import 'package:diet_app/resetpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:dietapp/api.dart';
//import 'package:dietapp/navigator.dart';
//import 'package:dietapp/register.dart';
//import 'package:dietapp/utils/constant.dart';
import 'api.dart';
import 'navigator.dart';
import 'register.dart';
import 'utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // return Future.value(true);
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');

        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return NavigatorWidget();
              } else {
                return SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, top: 34),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // _contentHeader(),

                        const SizedBox(
                          height: 18,
                        ),

                        Center(
                          child: Image.asset(
                            'assets/diet.png',
                            width: 200, // set the desired width
                            height: 200, // set the desired height
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),

                        const Center(
                          child: Text(
                            'DIET PLAN',
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        // Spacer(),
                        // Text(
                        //   'Accounting Tool',
                        //   style: Theme.of(context).textTheme.headline5,
                        // ),

                        // Text(
                        //   'For Small Business',
                        //   style: Theme.of(context).textTheme.titleSmall,
                        // ),
                        // const SizedBox(
                        //   height: 18,
                        // ),
                        // const SizedBox(
                        //   height: 30,
                        // ),
                        const Text(
                          'Login',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 16,
                        ),

                        // CustomInputField(
                        //   controller: userNumberController,
                        //   keyboardType: TextInputType.number,
                        //   hintText: 'Phone Number',
                        //   textInputAction: TextInputAction.next,
                        // ),
                        // // _contentServices(context),

                        // TextField(
                        //   decoration: new InputDecoration(labelText: "Enter your number"),
                        //   keyboardType: TextInputType.number,
                        //   inputFormatters: <TextInputFormatter>[
                        //     FilteringTextInputFormatter.digitsOnly
                        //   ], // Only numbers can be entered
                        // ),

                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: userEmailController,
                                validator: validateUsername,
                                // keyboardType: TextInputType.phone,
                                style: Theme.of(context).textTheme.bodyMedium,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColor.kPlaceholder3,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Username',
                                  hintStyle: const TextStyle(
                                    color: AppColor.kTextColor1,
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
                                controller: userPasswordController,
                                obscureText: true,
                                validator: validatePassword,
                                // keyboardType: TextInputType.phone,
                                style: Theme.of(context).textTheme.bodyMedium,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColor.kPlaceholder3,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                    color: AppColor.kTextColor1,
                                    fontSize: 14,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResetPassword(),
                              ),
                            );
                          },
                          child: Text(
                            "Forgot password",
                            style: TextStyle(color: Colors.blue),
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
                          onPressed: signIn,
                          // _submit();
                          // _login();

                          child: const Text(
                            'Login',
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

                        // const SizedBox(
                        //   height: 30,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: <Widget>[
                        //     Text(
                        //       'Not Registered?',
                        //       style: Theme.of(context).textTheme.bodyLarge,
                        //     ),
                        //     const SizedBox(
                        //       width: 10,
                        //     ),
                        //     InkWell(
                        //       onTap: () {
                        //         Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) => RegisterScreen()));
                        //       },
                        //       child: Text(
                        //         'Register here!',
                        //         style: Theme.of(context).textTheme.bodyLarge,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // // const SizedBox(height: 16),
                        // // _contentSendMoney(),
                        // const SizedBox(
                        //   height: 30,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: <Widget>[
                        //     Text(
                        //       'Services',
                        //       style: Theme.of(context).textTheme.headline4,
                        //     ),
                        //     SvgPicture.asset(
                        //       filter,
                        //       color: Theme.of(context).iconTheme.color,
                        //       width: 18,
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 16,
                        // ),
                        // _contentServices(context),

                        const SizedBox(
                          height: 30,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dont have an Account! ",
                              style: TextStyle(color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
                              },
                              child: Text(
                                'Register Here',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  String? validateUsername(String? value) {
// Indian Mobile number are of 10 digit only
    if (value!.isEmpty) {
      return 'Username Field must not be empty';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
// Indian Mobile number are of 10 digit only
    if (value!.isEmpty) {
      return 'Password Field must not be empty';
    } else if (value.length < 5)
      return 'Password must be of 8 or more digit';
    else
      return null;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // TODO SAVE DATA
      // _login();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavigatorWidget(),
        ),
      );
    }
  }

  // fetchProfileData(context) async {
  //   print(" Inside Profile function");

  //   var res = await CallApi()
  //       .authenticatedGetRequest('profile?user_id=${user_id}');

  //   print(res);
  //   if (res != null) {
  //     // print(res.body);

  //     var profileListItensJson = json.decode(res.body);
  //     print(profileListItensJson);
  //     return [];
  //   } else {
  //     return [];
  //   }
  // }

  var user_id;

  void _login() async {
    // setState(() {
    //   _isLoading = true;
    // });

    // var number = userNumberController.text;
    // print(_countryCodes);
    // var code = _selectedCountryCode
    //     .toString()
    //     .substring(1, _selectedCountryCode.toString().length);
    // if (number.length == 10) {
    //   number = number.substring(1, number.length);
    // }
    // var cellphone = code + number;

// // *************************************************
//     var data = {
//       'username': userEmailController.text,
//       'password': userPasswordController.text,
//     };

//     print(data);

//     var res = await CallApi().authenticatedPostRequest(data, 'auth/login');
//     if (res == null) {
//       // setState(() {
//       //   _isLoading = false;
//       //   // _not_found = true;
//       // });
//       // showSnack(context, 'No Network!');
//     } else {
//       var body = json.decode(res!.body);
//       print(body);

    // if (res.statusCode == 200) {
    //   SharedPreferences localStorage = await SharedPreferences.getInstance();
    //   // localStorage.setString("token", body['token']);
    //   localStorage.setString("user", json.encode(body['user']));
    //   localStorage.setString("token", json.encode(body['tokens']['access']));
    //   localStorage.setString("profile", json.encode(body['profile_data']));
    //   // localStorage.setString("phone_number", userNumberController.text);

    // setState(() {
    //   user_id = body['user']['id'];
    // });
    // if (body['profile'] == false) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => const ProfileFormScreen()));
    // } else if (body['profile'] == true) {
    // setState(() {});
    // fetchProfileData(context);

    //       Navigator.push(context,
    //           MaterialPageRoute(builder: (context) => NavigatorWidget()));
    //     // }
    //   } else if (res.statusCode == 400) {
    //     print('hhh');
    //     // setState(() {
    //     //   _isLoading = false;
    //     //   _not_found = true;
    //     // });
    //   } else {}
    // }

    // ignore: avoid_print
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmailController.text,
          password: userPasswordController.text);
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavigatorWidget(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      print("------------------------");
      print(e);
       showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Sign In Error"),
            content: Text(e.message.toString()),
            actions: [
              MaterialButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      
    }
  }
}
