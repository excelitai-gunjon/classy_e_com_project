import 'package:classy_ecom_project/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key? key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String? icon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin:
        EdgeInsets.symmetric(horizontal: 10),//getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(12),//getProportionateScreenWidth(12)),
        height: 40,//getProportionateScreenHeight(40),
        width: 40,//getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon!),
      ),
    );
  }
}