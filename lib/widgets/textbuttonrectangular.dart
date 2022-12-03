import 'package:flutter/material.dart';


class TextButtonRectangular extends StatelessWidget {
 TextButtonRectangular({required this.onPress,
   this.btnTextColor=Colors.white,
    this.btncolor=Colors.lightBlueAccent,
   this.btnheight=50.0,
   this.btnwidth=double.infinity,
   this.btnText='button',
   this.btnTextSize=20.0,
 });
  final VoidCallback onPress;
  final double btnheight;
 final double btnwidth;
  final Color btncolor;
  final String btnText;
  final Color btnTextColor;
  final double btnTextSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: Container(
          alignment: Alignment.center,
          height: btnheight,
          width: btnwidth,
          color: btncolor,
          child: Text(
            btnText,
            style: TextStyle(
              fontSize: btnTextSize,
              color: btnTextColor,
            ),
          ),
        ));
  }
}
