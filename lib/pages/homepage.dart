import 'package:flutter/material.dart';
import 'package:greaterescondido/widgets/CustomAppbar.dart';
import 'package:greaterescondido/widgets/customdrawer.dart';
import 'package:greaterescondido/widgets/customtextfieldrectwithicon.dart';
import 'package:greaterescondido/widgets/textbuttonrectangular.dart';
import 'package:greaterescondido/widgets/customfooter.dart';
import 'package:greaterescondido/models/webviewurl.dart';
import 'package:provider/provider.dart';
import 'package:greaterescondido/pages/customwebview.dart';
import 'package:greaterescondido/helper/constantcolor.dart';
import 'package:greaterescondido/helper/constantStyles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  String keyword = '';
  String postalCode = '';
  TextEditingController textEditingController1=TextEditingController();
  TextEditingController textEditingController2=TextEditingController();
  String _baseURL = 'https://directory.greaterescondido.org/';

  String searchURL() {
    List<String> original = textEditingController1.text.split(' ');
    String temp = '';
    for (int i = 0; i < original.length; i++) {
      if (i == 0) {
        temp = original[i];
      } else {
        temp = temp + '+' + original[i];
      }
    }
    temp=_baseURL + 'search_results?q=$temp&postal_code=${textEditingController2.text}';
    textEditingController1.clear();
    textEditingController2.clear();
    return temp;
  }

  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Consumer<WebViewURL>(builder: (_, WebViewURL, child) {
      WebViewURL.toggleHomePage();
      return SafeArea(
        child: Scaffold(
          backgroundColor: kHomeBackGrooundColor,
          appBar: CustomAppBar(appbar_height: mediaQuery.height / 15),
          endDrawer: CustomDrawer(mediaQuery: mediaQuery,),
          body: ListView(
            children: [
              CustomSearchWidget(
                textController1: textEditingController1,
                  textController2: textEditingController2,
                  mediaQuery: mediaQuery,
                  keywordField: (value) {
                    keyword = value;
                  },
                  zipField: (value) {
                    postalCode = value;
                  },
                  btnPress: () {
                    WebViewURL.addURL(url: searchURL(),context: context);
                  }),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(mediaQuery.width / 30),
                width: double.infinity,
                decoration:
                    const BoxDecoration(color: kHomeFeaturedBackGroundColor),
                child: Column(
                  children: [
                    Text(
                      'Featured Sponsors of this Directory',
                      style: TextStyle(
                        fontSize: mediaQuery.height / 45,
                        fontWeight: FontWeight.w500,
                        color: kHomeFeaturedTextColor,
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height / 100,
                    ),
                    Text(
                      'This directory is provided as a service to our community by '
                      'the Greater Escondido Chamber of Commerce. Special appreciation goes to the City of Escondido and the sponsors shown, who make substantial annual '
                      'contributions to our Chamber making this and other programs possible.',
                      style: TextStyle(
                        color: kHomeFeaturedTextColor,
                        fontSize: mediaQuery.height / 60,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: mediaQuery.height / 50,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: mediaQuery.height / 7,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          CustomCardHome(
                              cardlink: () {
                                String tempURL = _baseURL +
                                    'california/escondido/greater-escondido/lounsbery-ferguson-altona-peak-llp-124';
                                WebViewURL.addURL(url: tempURL,context: context);
                              },
                              cardTitle: 'Lounsbery Ferguson Altona & Peak LLP',
                              mediaQuery: mediaQuery,
                              cardimage: 'images/limage0.png',
                              cardSpecialty: 'Attorneys',
                              cardLoaction: 'Escondido, CA'),
                          CustomCardHome(
                              cardlink: () {
                                String tempURL = _baseURL +
                                    'california/escondido/greater-escondido/palomar-health';
                                WebViewURL.addURL(context: context,url: tempURL);
                              },
                              cardTitle: 'Palomar Health',
                              mediaQuery: mediaQuery,
                              cardimage: 'images/limage1.png',
                              cardSpecialty: 'Medical',
                              cardLoaction: 'Escondido, CA'),
                          CustomCardHome(
                              cardlink: () {
                                String tempURL = _baseURL +
                                    'california/escondido/greater-escondido/the-super-dentists';
                                WebViewURL.addURL(url: tempURL,context: context);
                              },
                              cardTitle: 'The Super Dentists',
                              mediaQuery: mediaQuery,
                              cardimage: 'images/limage2.png',
                              cardSpecialty: 'Dentist',
                              cardLoaction: 'Escondido, CA'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: SizedBox(
                  width: double.infinity,
                  height: mediaQuery.height / 5.4,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      CustomHomeCard1(
                          mediaQuery: mediaQuery,
                          cardTitle: 'Are You A Professional?',
                          cardDec:
                              'Finding professionals is easy with the Inland North County Business Directory. '
                              'Search our app to instantly connect with professionals. '
                              'For professionals, our app works as a powerful tool for attracting more clients.',
                          onClicked: () {
                            String tempURL = _baseURL + 'join';
                            WebViewURL.addURL(url: tempURL,context: context);
                          },
                          cardbtnText: 'Join Our Site Today',
                          cardbtncolor: kHomeCard1ButtonJoinSiteColor),
                      SizedBox(
                        width: 10,
                      ),
                      CustomHomeCard1(
                          mediaQuery: mediaQuery,
                          cardTitle: 'About Our New App',
                          cardDec:
                              'Finding professionals is easy with the Inland North County Business Directory. '
                              'Search our app to instantly connect with professionals. For professionals,'
                              ' our app works as a powerful tool for attracting more clients.',
                          onClicked: () {
                            String tempURL = _baseURL + 'join';
                            WebViewURL.addURL(url: tempURL,context: context);
                          },
                          cardbtnText: 'Get Listed Today',
                          cardbtncolor: kHomeCard1ButtonGetListColor),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: CustomFooter(mediaQuery: mediaQuery,),
        ),
      );
    });
  }
}

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    Key? key,
    required this.mediaQuery,
    required this.keywordField,
    required this.zipField,
    required this.btnPress,
    required this.textController1,
    required this.textController2,
  }) : super(key: key);
  final Size mediaQuery;
  final Function(String) keywordField;
  final Function(String) zipField;
  final VoidCallback btnPress;
  final TextEditingController textController1;
  final TextEditingController textController2;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: mediaQuery.height / 3,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/back3.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        width: mediaQuery.width - mediaQuery.width / 10,
        height: mediaQuery.height / 3.5,
        decoration: BoxDecoration(
          color: kHomeSearchWidgetBackgroudColor.withOpacity(0.6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Serving Inland North Country',
              style: TextStyle(
                color: kHomeSearchWidgetHeaderColor,
                fontSize: mediaQuery.height / 35,
              ),
            ),
            CustomTextFieldRectWithIcon(
              controller: textController1,
                textFieldIcon: Icons.search,
                mediaQuery: mediaQuery,
                placeHolderText: 'Name or Keyword',
                valueChange: keywordField),
            CustomTextFieldRectWithIcon(
              controller: textController2,
                textFieldIcon: Icons.near_me,
                mediaQuery: mediaQuery,
                placeHolderText: 'Zip Code (Optional)',
                valueChange: zipField),
            TextButtonRectangular(
              onPress: btnPress,
              btncolor: kHomeSearchButtonColor,
              btnText: 'Search',
              btnwidth: mediaQuery.width -
                  mediaQuery.width / 3 +
                  mediaQuery.height / 18,
            )
          ],
        ),
      ),
    );
  }
}

class CustomHomeCard1 extends StatelessWidget {
  const CustomHomeCard1({
    Key? key,
    required this.mediaQuery,
    required this.cardTitle,
    required this.cardDec,
    required this.onClicked,
    required this.cardbtnText,
    required this.cardbtncolor,
  }) : super(key: key);

  final Size mediaQuery;
  final String cardTitle;
  final String cardDec;
  final VoidCallback onClicked;
  final String cardbtnText;
  final Color cardbtncolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: mediaQuery.width / 45,
          left: mediaQuery.width / 45,
          right: mediaQuery.width / 45),
      width: mediaQuery.width / 1.5,
      decoration: BoxDecoration(
        color: kHomeCard1BackGroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            cardTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: mediaQuery.height / 50,
              fontWeight: FontWeight.w500,
              color: kHomeCard1TextColor
            ),
          ),
          SizedBox(
            height: mediaQuery.height / 300,
          ),
          Text(
            cardDec,
            style: TextStyle(
              color: kHomeCard1TextColor,
              fontSize: mediaQuery.height / 75,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: mediaQuery.height / 800,
          ),
          TextButtonRectangular(
            onPress: onClicked,
            btnText: cardbtnText,
            btncolor: cardbtncolor,
            btnheight: mediaQuery.height / 30,
            btnTextSize: mediaQuery.height / 45,
          )
        ],
      ),
    );
  }
}

class CustomCardHome extends StatelessWidget {
  const CustomCardHome({
    Key? key,
    required this.cardlink,
    required this.cardTitle,
    required this.mediaQuery,
    required this.cardimage,
    required this.cardSpecialty,
    required this.cardLoaction,
  }) : super(key: key);

  final VoidCallback cardlink;
  final String cardTitle;
  final Size mediaQuery;
  final String cardimage;
  final String cardSpecialty;
  final String cardLoaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: mediaQuery.width / 20),
      padding: EdgeInsets.all(mediaQuery.width / 50),
      width: mediaQuery.width / 2,
      decoration: BoxDecoration(
        color: kHomeCardBackGroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: cardlink,
            child: Text(cardTitle,
                style: TextStyle(color: kHomeCardHeadingTextColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
              width: mediaQuery.width / 5,
              height: mediaQuery.height / 10.5,
              child: Image.asset(
                cardimage,
              ),
            ),
            SizedBox(
              width: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Specialty',
                  style: TextStyle(color:kHomeCardText1Color,fontSize: mediaQuery.height/80),
                ),
                Text(
                  cardSpecialty,
                  style: TextStyle(color:kHomeCardText2Color, fontSize: mediaQuery.height/80),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Located in',
                  style: TextStyle(color:kHomeCardText1Color,fontSize: mediaQuery.height/80),
                ),
                Text(
                  cardLoaction,
                  style: TextStyle(color: kHomeCardText2Color, fontSize: mediaQuery.height/80),
                ),
              ],
            ),
            SizedBox(
              width: 1,
            ),
          ]),
        ],
      ),
    );
  }
}
