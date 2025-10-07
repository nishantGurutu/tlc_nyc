import 'package:flutter/material.dart';
import 'package:tlc_nyc/constant/color_constant.dart';


class StatusBar extends StatelessWidget {
  const StatusBar({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      decoration:    BoxDecoration(
        color: primary
        // gradient: LinearGradient(
        //   colors: [PRIMARY_COLOR_1, PRIMARY_COLOR_2],
        //   begin: Alignment.centerLeft,
        //   end: Alignment.centerRight,
        //   stops: [0.0, 1.0],
        // ),
      ),
    );
  }
}