import 'package:classy_ecom_project/controller/api_services.dart';
import 'package:classy_ecom_project/model/log_in_data_model.dart';
import 'package:classy_ecom_project/routes.dart';
import 'package:classy_ecom_project/theme.dart';
import 'package:classy_ecom_project/view/home_page.dart';
import 'package:classy_ecom_project/view/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ApiRequest()),
        ChangeNotifierProvider.value(value: LogInDataModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        //home:  HomePage(),
        //initialRoute: SignInScreen.routeName,
        home: SignInScreen(),
        routes: routes,
      ),
    );
  }
}
