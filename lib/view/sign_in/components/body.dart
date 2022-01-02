import 'package:classy_ecom_project/size_config.dart';
import 'package:classy_ecom_project/view/components/no_account_text.dart';
import 'package:classy_ecom_project/view/components/socal_card.dart';
import 'package:classy_ecom_project/view/sign_in/components/sign_form.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 20), //getProportionateScreenWidth(20.0)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20), //SizeConfig.screenHeight * 0.04),
                SizedBox(
                  height: 200,
                  width: 400,
                  child: Image.asset("assets/images/classy.png",fit: BoxFit.contain,),
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28, //getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20), //SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: 20), //SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 20, //getProportionateScreenHeight(20),
                ),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
