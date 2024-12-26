import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarUnselectedIcon extends StatelessWidget {
  NavBarUnselectedIcon({required this.imgaename});
   String imgaename;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/${imgaename}.svg',
      height: 28 ,
      width: 28,
      fit: BoxFit.fill,
    );
  }
}
