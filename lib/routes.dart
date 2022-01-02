//import 'dart:js';

import 'package:classy_ecom_project/test/search_Demo.dart';
import 'package:classy_ecom_project/view/home_page.dart';
import 'package:classy_ecom_project/view/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';

final Map<String,WidgetBuilder> routes ={
  SignInScreen.routeName:(cotext)=>SignInScreen(),
  HomePage.routeName:(context)=>HomePage(),
  SearchDemo.routeName:(context)=>SearchDemo(),
};