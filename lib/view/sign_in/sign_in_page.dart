import 'package:classy_ecom_project/view/sign_in/components/body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
        title: Text("Sign In",style: TextStyle(color: Colors.black38),),
      ),
      body: Body(),
    );
  }
}