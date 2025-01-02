import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  Color? color;
  LoadingIndicator({this.color});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color:color?? Theme.of(context).primaryColor,
    ));
  }
}
