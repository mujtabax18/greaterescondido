import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:greaterescondido/pages/homepage.dart';
import 'package:greaterescondido/models/webviewurl.dart';
import 'package:greaterescondido/helper/constantStyles.dart';
import 'package:greaterescondido/helper/constantcolor.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
    required this.mediaQuery,
  }) : super(key: key);

  final Size mediaQuery;
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

double col2size=200;
double col1size=561;
double getupperheight(double h){

  if(h-col2size<col1size){
    h=col1size;
  }else{
    h=h-col2size;
  }
  return h;
}


class _CustomDrawerState extends State<CustomDrawer> {
  String _baseURL='https://directory.greaterescondido.org/';
  @override
  Widget build(BuildContext context) {
    return  Consumer<WebViewURL>(
        builder: (_,WebViewURL,child){
          return new Drawer(
            backgroundColor: kDawerBackground,
            width: widget.mediaQuery.width/2.5,
            child: ListView(
              children: [
                SizedBox(
                  height: getupperheight(widget.mediaQuery.height-30),
                  width: widget.mediaQuery.width/3,
                  child: Column(
                    children: [
                      DrawerHeader(
                        child: GestureDetector(
                            onTap: (){
                              if(!WebViewURL.homepage) {
                                Navigator.pushNamed(context, HomePage.id);
                              }
                            },
                            child:  Container(
                                width:  widget.mediaQuery.width/2.5,
                                color: Colors.white,
                                child: Image.asset('images/ged-logo.png',)),),
                        decoration: BoxDecoration(
                          color: kDawerHeaderBackgroundColor,
                        ),
                      ),
                      CustomListTile(
                        ontap: (){
                          if(!WebViewURL.homepage) {
                            Navigator.pushNamed(context, HomePage.id);
                          }
                        },
                        text: 'Home',
                      ),
                      CustomListTile(
                        ontap: (){
                          String tempURL=_baseURL+'about';
                          WebViewURL.addURL(url: tempURL,context: context);
                        },
                        text: 'About',
                      ),
                      CustomListTile(
                        ontap: (){
                          String tempURL=_baseURL+'about/contact';
                          WebViewURL.addURL(url: tempURL,context: context);
                        },
                        text: 'Contact Us',
                      ),
                      CustomListTile(
                        ontap: (){
                          String tempURL=_baseURL+'news';
                          WebViewURL.addURL(url: tempURL,context: context);
                        },
                        text: 'Latest News',
                      ),
                      CustomListTile(
                        ontap: (){
                          String tempURL=_baseURL+'jobs';
                          WebViewURL.addURL(url: tempURL,context: context);
                        },
                        text: 'Jobs Listings',
                      ),
                      CustomListTile(
                        ontap: (){
                          String tempURL=_baseURL+'join';
                          WebViewURL.addURL(url: tempURL,context: context);
                        },
                        tileColor: kDawerTileColorSecondary,
                        text: 'Join Today',
                      ),
                      CustomListTile(
                        ontap: (){
                          String tempURL=_baseURL+'login';
                          WebViewURL.addURL(url: tempURL,context: context);
                        },
                        tileColor: kDawerTileColorSecondary,
                        text: 'Member Login',
                      ),
                    ],
                  ),
                ),
                Container(
                  height: col2size,
                  width: widget.mediaQuery.width/2.5,
                  child: GestureDetector(
                    onTap: (){
                      String tempURL='https://greaterescondido.org/';
                      WebViewURL.addURL(url: tempURL,context: context);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Visit Greater Escondido',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),),
                        Container(
                          width:  widget.mediaQuery.width/2.5,
                            color: Colors.white,
                            child: Image.asset('images/greater-escondido-chamber.png',)),
                      ],
                    ),
                  ),
                ),
              ],

            ),
          );

        });
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.text,
    required this.ontap,
    this.tileColor=kDawerTileColorPrimery,
  }) : super(key: key);
  final String text;
  final VoidCallback ontap;
  final Color tileColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      tileColor: tileColor,
      leading: Text(text,style: kStyleDrawerTile),
    );
  }
}