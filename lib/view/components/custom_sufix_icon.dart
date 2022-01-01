//import 'package:classy_ecom_project/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        20,
        20,
        20,
        // getProportionateScreenWidth(20),
        // getProportionateScreenWidth(20),
        // getProportionateScreenWidth(20),
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: 20,//getProportionateScreenWidth(18),
      ),
    );
  }
}
