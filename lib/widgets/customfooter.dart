import 'package:flutter/material.dart';
import 'package:greaterescondido/models/webviewurl.dart';
import 'package:provider/provider.dart';
import 'package:greaterescondido/pages/customwebview.dart';
import 'package:greaterescondido/helper/constantcolor.dart';
import 'package:greaterescondido/helper/constantStyles.dart';

class CustomFooter extends StatefulWidget {
  const CustomFooter({Key? key,
  required this.mediaQuery,

  }) : super(key: key);
 final Size mediaQuery;

  @override
  State<CustomFooter> createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
  String _baseURL='https://directory.greaterescondido.org/';

  @override
  Widget build(BuildContext context) {
    return Consumer<WebViewURL>(
        builder: (_,WebViewURL,child){
      return  Container(
        width: double.infinity,
        height: widget.mediaQuery.height/35,
        decoration: BoxDecoration(
          color:kFooterBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('© 2022',
              style: kSyleFooterText,),
            SizedBox(width: 5,),
            GestureDetector(
              onTap: (){
                if(!WebViewURL.homepage) {
                  Navigator.pop(context);
                }
              },
              child: Text('Greater Escondido Directory',
                style:kSyleFooterText,),
            ),
            SizedBox(width: 5,),
            Text('All Rights Reserved',
              style: kSyleFooterText,),
            SizedBox(width: 5,),
            GestureDetector(
              onTap: (){
                String tempURL=_baseURL+'about/terms';
                WebViewURL.addURL(url: tempURL,context: context);

              },
              child: Text('Terms of Use',
                style: kSyleFooterText,),
            ),
            SizedBox(width: 5,),
            GestureDetector(
              onTap: (){
                String tempURL=_baseURL+'about/privacy';
                WebViewURL.addURL(url: tempURL,context: context);
              },
              child: Text('Privacy Policy',
                style: kSyleFooterText,),
            ),
          ],
        ),
      ); });
  }
}
