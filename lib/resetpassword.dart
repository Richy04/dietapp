import 'package:diet_app/utils/constant.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController userOldPasswordController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  String? validateUsername(String? value) {
// Indian Mobile number are of 10 digit only
    if (value!.isEmpty) {
      return 'oldpassword Field must not be empty';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
// Indian Mobile number are of 10 digit only
    if (value!.isEmpty) {
      return 'New Password Field must not be empty';
    } else if (value.length < 8)
      return 'Password must be of 8 or more digit';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:18, right: 18,top: 34),
          child: Column(
            children: [
                       
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

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: userOldPasswordController,
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
                        hintText: 'Old password',
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
                        hintText: 'New Password',
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
              SizedBox(height: 20,),
              MaterialButton(
                 elevation: 0,
                  color: Colors.orange,
                  height: 50,
                  minWidth: 500,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {
                    
                 
                  },
              child: Text("Submit"),),
            ],
          ),
        ),
      ),
    );
  }
}
