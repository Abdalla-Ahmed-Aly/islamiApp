import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamiapp/app_theme.dart';

class NavBarSelectedIcon extends StatelessWidget {
  NavBarSelectedIcon({required this.imgaename});
  String imgaename;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(66),
      ),
      child: SvgPicture.asset(
        'assets/icons/$imgaename.svg',
        height: 22,
        width: 22,
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
