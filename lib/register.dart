import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:diet_app/api.dart';
import 'package:diet_app/login.dart';
import 'package:diet_app/utils/constant.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // TODO SAVE DATA

      _register();
    }
  }

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 34),
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
                    'DIET APP',
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.orange,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                const Center(
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
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
                      // TextFormField(
                      //   controller: userNameController,
                      //   validator: validateUsername,
                      //   // keyboardType: TextInputType.phone,
                      //   style: Theme.of(context).textTheme.bodyMedium,
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: AppColor.kPlaceholder3,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(
                      //         8,
                      //       ),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //     hintText: 'Username',
                      //     hintStyle: const TextStyle(
                      //       color: AppColor.kTextColor1,
                      //       fontSize: 14,
                      //     ),
                      //     contentPadding: const EdgeInsets.symmetric(
                      //       horizontal: 12,
                      //       vertical: 8,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: userEmailController,
                        // validator: validateEmail,R
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
                          hintText: 'Email',
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
                      const SizedBox(
                        height: 30,
                      ),
                      // TextFormField(
                      //   controller: userPhoneController,
                      //   validator: validateMobile,
                      //   keyboardType: TextInputType.phone,
                      //   style: Theme.of(context).textTheme.bodyMedium,
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: AppColor.kPlaceholder3,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(
                      //         8,
                      //       ),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //     hintText: 'Phone Number',
                      //     hintStyle: const TextStyle(
                      //       color: AppColor.kTextColor1,
                      //       fontSize: 14,
                      //     ),
                      //     contentPadding: const EdgeInsets.symmetric(
                      //       horizontal: 12,
                      //       vertical: 8,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                Center(
                  child: MaterialButton(
                    elevation: 0,
                    color: Colors.orange,
                    height: 50,
                    minWidth: 500,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    onPressed: signUp

                    // _submit();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => OTP_Screen(),
                    //   ),
                    // );
                    ,
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already Registered?',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'Login here!',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 30,
                ),
                // const SizedBox(height: 16),
                // _contentSendMoney(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  // String? validateEmail(String? value) {
  //   String pattern =
  //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //   RegExp regex = RegExp(pattern);
  //   if (!regex.hasMatch(value!)) {
  //     return 'Enter Valid Email';
  //   } else {
  //     return null;
  //   }
  // }

  String? validateMobile(String? value) {
// Indian Mobile number are of 10 digit only
    if (value!.length != 10) {
      return 'Mobile Number must be of 10 digit';
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
    } else if (value.length < 6)
      return 'Password must be of 8 or more digit';
    else
      return null;
  }

  void _register() async {
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

// *******************************************************
    var data = {
      'username': userNameController.text,
      'email': userEmailController.text,
      'password': userPasswordController.text,
      'phone': userPhoneController.text,
      // 'type': 'driver',
    };

    print(data);

    var res = await CallApi().authenticatedPostRequest(data, 'auth/register');
    if (res == null) {
      // setState(() {
      //   _isLoading = false;
      //   // _not_found = true;
      // });
      // showSnack(context, 'No Network!');
    } else {
      var body = json.decode(res!.body);
      print(body);

      if (res.statusCode == 200) {
        // SharedPreferences localStorage = await SharedPreferences.getInstance();
        // localStorage.setString("token", body['token']);
        // localStorage.setString("user", json.encode(body['user']));
        // localStorage.setString("token", json.encode(body['tokens']['access']));
        // localStorage.setString("phone_number", userNumberController.text);

        // setState(() {
        //   _isLoading = false;
        // });

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else if (res.statusCode == 400) {
        print('hhh');
        // setState(() {
        //   _isLoading = false;
        //   _not_found = true;
        // });
      } else {}
    }

    // ignore: avoid_print
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userEmailController.text.trim(),
          password: userPasswordController.text.trim());
      return Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
