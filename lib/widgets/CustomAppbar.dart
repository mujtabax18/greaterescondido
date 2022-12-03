import 'package:flutter/material.dart';
import 'package:greaterescondido/helper/constantcolor.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    Key? key,
    required this.appbar_height,
  }) : super(key: key);

  final double appbar_height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color:kAppBarBackGroundColor,
      // we can set width here with conditions
      width: double.infinity,
      height: appbar_height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('images/ged-logo.png',),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Greater  Escondido Directory',
                  style: TextStyle(
                    color: kAppBarText1Color,
                    fontSize: 16,
                  )),
              Text('Serving Inland North County',
                style: TextStyle(
                    fontSize: 14,
                    color: kAppBarText2Color,
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: (){
                Scaffold.of(context).openEndDrawer();
              },
              icon: Icon(Icons.menu)),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, appbar_height);
}