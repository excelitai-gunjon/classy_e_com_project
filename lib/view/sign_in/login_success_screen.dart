import 'package:classy_ecom_project/size_config.dart';
import 'package:classy_ecom_project/view/components/default_button.dart';
import 'package:flutter/material.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Success"),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height* 0.04),//SizeConfig.screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            height: MediaQuery.of(context).size.height* 0.04, //40%
          ),
          SizedBox(height: MediaQuery.of(context).size.height* 0.08),//SizeConfig.screenHeight * 0.08),
          Text(
            "Login Success",
            style: TextStyle(
              fontSize: 30,//getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.6,//SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: "Back to home",
              press: () {
                //Navigator.pushNamed(context, HomeScreen.routeName);
                Navigator.pop(context);
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
