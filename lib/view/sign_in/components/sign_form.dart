import 'dart:convert';

import 'package:classy_ecom_project/constants.dart';
import 'package:classy_ecom_project/controller/api_services.dart';
import 'package:classy_ecom_project/http_end_point.dart';
import 'package:classy_ecom_project/key_board_Util.dart';
import 'package:classy_ecom_project/model/all_product_model.dart';
import 'package:classy_ecom_project/model/log_in_data_model.dart';
import 'package:classy_ecom_project/size_config.dart';
import 'package:classy_ecom_project/test/search_Demo.dart';
import 'package:classy_ecom_project/view/components/custom_sufix_icon.dart';
import 'package:classy_ecom_project/view/components/default_button.dart';
import 'package:classy_ecom_project/view/components/from_error.dart';
import 'package:classy_ecom_project/view/home_page.dart';
import 'package:classy_ecom_project/view/sign_in/components/forgot_password_screen.dart';
import 'package:classy_ecom_project/view/sign_in/login_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: 30), //getProportionateScreenHeight(30.0)),
          buildPasswordFormField(),
          SizedBox(height: 30), //getProportionateScreenHeight(30.0)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  ForgotPasswordScreen.routeName,
                ),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: 20), //getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                final signInRes=Provider.of<ApiRequest>(context,listen: false);
                signInRes.SignInApiRequest(
                  {
                    "email":email.toString(),
                    "password":password.toString(),
                  },
                  context,
                ).then((value){
                  final loginData=Provider.of<LogInDataModel>(context,listen: false);
                  //print(value.+"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
                  print(loginData.data!.profilePhotoUrl.toString()+">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                  //List<LogInDataModel> items=value as List<LogInDataModel>;
                  //LogInDataModel item=LogInDataModel.fromJson(value);
                  //print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+value[0].email);
                  //print(value);
                  //return null;
                  //Navigator.pushNamed(context, HomePage.routeName);
                  Navigator.pushNamed(context, SearchDemo.routeName);
                  //return null;
                });
                //Navigator.pushNamed(context, HomePage.routeName);
                // final response = await http.post(
                //   Uri.parse(logInApi),
                //   body:
                //   {
                //     "email":email.toString(),
                //     "password":password.toString(),
                //   },
                // );
                // print('Response status: ${response.statusCode}');
                // print('Response body: ${response.body}');
                //
                // if (response.statusCode == 200) {
                //   final data = jsonDecode(response.body);
                //   LogInDataModel logindata = LogInDataModel.fromJson(data);
                //
                //   print(logindata.token);
                //   Navigator.pushNamed(context, HomePage.routeName);
                //   //return logindata; //data.map((e) => LogInDataModel.fromJson(e)).toList();
                // } else {
                //   // If that call was not successful, throw an error.
                //   throw Exception('Failed to load post');
                // }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 4) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
