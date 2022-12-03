import 'package:flutter/material.dart';

class CustomTextFieldRectWithIcon extends StatelessWidget {
  const CustomTextFieldRectWithIcon({
    Key? key,
    required this.textFieldIcon,
    required this.mediaQuery,
    required this.placeHolderText,
    required this.valueChange,
    required this.controller
  }) : super(key: key);

  final TextEditingController controller;
  final IconData textFieldIcon;
  final Size mediaQuery;
  final String placeHolderText;

  final  Function(String) valueChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Center(child: Icon(
            textFieldIcon,
            color: Colors.black,)),
          width: mediaQuery.height/18,
          height: mediaQuery.height/18,
          decoration: BoxDecoration(
              color: Color(0xffEEEEEE)
          ),
        ),
        SizedBox(
          width: mediaQuery.width-mediaQuery.width/3,
          height: mediaQuery.height/18,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 17,
                  color: Colors.grey.shade400),
              hintText: placeHolderText,
              border:OutlineInputBorder(
                  borderRadius:BorderRadius.zero
              ),
              filled: true, //<-- SEE HERE
              fillColor: Colors.white,
            ),
            onChanged: valueChange,

          ),
        ),
      ],
    );
  }
}