import 'dart:io';


import 'package:flutter/material.dart';

import '../data/api_provider/auth_api_provider.dart';
import '../data/model/user_model.dart';
import '../data/shared/data_response.dart';
import '../data/shared/error_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _imageUrlCOntroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customTxtField("Fist Name", _firstNameController),
              customTxtField("last_name", _lastNameController),
              customTxtField("email", _emailController),
              customTxtField("phone", _phoneController),
              customTxtField("country_code", _countryCodeController),
              customTxtField("password", _passwordController),
              customTxtField("confirm Pssword", _confirmPasswordController),
              customTxtField("role", _roleController),
              customTxtField("image", _imageUrlCOntroller),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: signUp,
                  child: Container(
                    color: Colors.orange,
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    child: Text('Press Enter'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customTxtField(String hintText, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText
        ),
      ),
    );
  }

  Future signUp() async {
    AuthApiProvider _auth = AuthApiProvider();

    var model = UserModel(
        first_name: _firstNameController.text,
        last_name: _lastNameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        country_code: _countryCodeController.text,
        password: _passwordController.text,
        confirm_password: _confirmPasswordController.text,
        role: "2",
        device_type: Platform.isAndroid ? "1" : "1",
        /*device_token: _preferenceHelper.getFcmToken(),*/
        location: "Saudi Arabia",
        latitude: 23.8859,
        longitude: 45.0792
    );
    var response = await AuthApiProvider().signUp(model);
    if (response is ErrorModel) {
      print(response.message);
    } else {
      var dataResponse = response as DataResponse;
      if (dataResponse.success == true) {
        print("SUccesfful");
      } else {
        print(dataResponse.message);
      }
    }
  }
}